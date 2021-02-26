/**
 * @license
 * Copyright (C) 2020 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {html} from 'lit-html';
import {
  css,
  customElement,
  internalProperty,
  property,
  PropertyValues,
} from 'lit-element';
import {GrLitElement} from '../lit/gr-lit-element';
import {Action, CheckResult, CheckRun} from '../../api/checks';
import {
  allActions$,
  allResults$,
  allRuns$,
  someProvidersAreLoading$,
} from '../../services/checks/checks-model';
import './gr-checks-runs';
import './gr-checks-results';
import {sharedStyles} from '../../styles/shared-styles';
import {changeNum$, currentPatchNum$} from '../../services/change/change-model';
import {NumericChangeId, PatchSetNum} from '../../types/common';
import {
  ActionTriggeredEvent,
  fireActionTriggered,
} from '../../services/checks/checks-util';
import {checkRequiredProperty} from '../../utils/common-util';
import {RunSelectedEvent} from './gr-checks-runs';
import {ChecksTabState} from '../../types/events';
import {fireAlert} from '../../utils/event-util';
import {appContext} from '../../services/app-context';
import {from, timer} from 'rxjs';
import {takeUntil} from 'rxjs/operators';

/**
 * The "Checks" tab on the Gerrit change page. Gets its data from plugins that
 * have registered with the Checks Plugin API.
 */
@customElement('gr-checks-tab')
export class GrChecksTab extends GrLitElement {
  @property()
  runs: CheckRun[] = [];

  results: CheckResult[] = [];

  actions: Action[] = [];

  @property()
  tabState?: ChecksTabState;

  @property()
  currentPatchNum: PatchSetNum | undefined = undefined;

  @property()
  changeNum: NumericChangeId | undefined = undefined;

  @property()
  someProvidersAreLoading = false;

  @internalProperty()
  selectedRuns: string[] = [];

  private readonly checksService = appContext.checksService;

  constructor() {
    super();
    this.subscribe('runs', allRuns$);
    this.subscribe('actions', allActions$);
    this.subscribe('results', allResults$);
    this.subscribe('currentPatchNum', currentPatchNum$);
    this.subscribe('changeNum', changeNum$);
    this.subscribe('someProvidersAreLoading', someProvidersAreLoading$);

    this.addEventListener('action-triggered', (e: ActionTriggeredEvent) =>
      this.handleActionTriggered(e.detail.action, e.detail.run)
    );
  }

  static get styles() {
    return [
      sharedStyles,
      css`
        :host {
          display: block;
        }
        .header {
          display: flex;
          justify-content: space-between;
          padding: var(--spacing-m) var(--spacing-l);
          border-bottom: 1px solid var(--border-color);
        }
        .action {
          margin-left: var(--spacing-m);
        }
        .container {
          display: flex;
        }
        .runs {
          min-width: 300px;
          min-height: 400px;
          border-right: 1px solid var(--border-color);
        }
        .results {
          background-color: var(--background-color-secondary);
          flex-grow: 1;
        }
      `,
    ];
  }

  render() {
    const ps = `Patchset ${this.currentPatchNum} (Latest)`;
    const filteredRuns = this.runs.filter(
      r =>
        this.selectedRuns.length === 0 ||
        this.selectedRuns.includes(r.checkName)
    );
    return html`
      <div class="header">
        <div class="left">
          <gr-dropdown-list
            value="${ps}"
            .items="${[
              {
                value: `${ps}`,
                text: `${ps}`,
              },
            ]}"
          ></gr-dropdown-list>
          <span ?hidden="${!this.someProvidersAreLoading}">Loading...</span>
        </div>
        <div class="right">
          ${this.actions.map(this.renderAction)}
        </div>
      </div>
      <div class="container">
        <gr-checks-runs
          class="runs"
          .runs="${this.runs}"
          .selectedRuns="${this.selectedRuns}"
          @run-selected="${this.handleRunSelected}"
        ></gr-checks-runs>
        <gr-checks-results
          class="results"
          .runs="${filteredRuns}"
        ></gr-checks-results>
      </div>
    `;
  }

  protected updated(changedProperties: PropertyValues) {
    super.updated(changedProperties);
    if (changedProperties.has('tabState')) {
      const check = this.tabState?.checkName;
      if (check) {
        this.selectedRuns = [check];
      }
    }
  }

  renderAction(action: Action) {
    return html`<gr-checks-top-level-action
      .action="${action}"
    ></gr-checks-top-level-action>`;
  }

  handleActionTriggered(action: Action, run?: CheckRun) {
    if (!this.changeNum) return;
    if (!this.currentPatchNum) return;
    const promise = action.callback(
      this.changeNum,
      this.currentPatchNum as number,
      run?.attempt,
      run?.externalId,
      run?.checkName,
      action.name
    );
    // Plugins *should* return a promise, but you never know ...
    if (promise?.then) {
      const prefix = `Triggering action '${action.name}'`;
      fireAlert(this, `${prefix} ...`);
      from(promise)
        // If the action takes longer than 5 seconds, then most likely the
        // user is either not interested or the result not relevant anymore.
        .pipe(takeUntil(timer(5000)))
        .subscribe(result => {
          if (result.errorMessage) {
            fireAlert(this, `${prefix} failed with ${result.errorMessage}.`);
          } else {
            fireAlert(this, `${prefix} successful.`);
            this.checksService.reloadForCheck(run?.checkName);
          }
        });
    } else {
      fireAlert(this, `Action '${action.name}' triggered.`);
    }
  }

  handleRunSelected(e: RunSelectedEvent) {
    this.toggleSelected(e.detail.checkName);
  }

  toggleSelected(checkName: string) {
    if (this.selectedRuns.includes(checkName)) {
      this.selectedRuns = this.selectedRuns.filter(r => r !== checkName);
    } else {
      this.selectedRuns = [...this.selectedRuns, checkName];
    }
  }
}

@customElement('gr-checks-top-level-action')
export class GrChecksTopLevelAction extends GrLitElement {
  @property()
  action!: Action;

  connectedCallback() {
    super.connectedCallback();
    checkRequiredProperty(this.action, 'action');
  }

  render() {
    return html`
      <gr-button link class="action" @click="${this.handleClick}"
        >${this.action.name}</gr-button
      >
    `;
  }

  handleClick() {
    fireActionTriggered(this, this.action);
  }
}

declare global {
  interface HTMLElementTagNameMap {
    'gr-checks-tab': GrChecksTab;
    'gr-checks-top-level-action': GrChecksTopLevelAction;
  }
}
