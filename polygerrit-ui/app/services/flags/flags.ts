/**
 * @license
 * Copyright 2020 Google LLC
 * SPDX-License-Identifier: Apache-2.0
 */
import {Finalizable} from '../registry';

export interface FlagsService extends Finalizable {
  isEnabled(experimentId: string): boolean;
  enabledExperiments: string[];
}

/**
 * Experiment ids used in Gerrit.
 */
export enum KnownExperimentId {
  NEW_IMAGE_DIFF_UI = 'UiFeature__new_image_diff_ui',
  CHECKS_DEVELOPER = 'UiFeature__checks_developer',
  PUSH_NOTIFICATIONS_DEVELOPER = 'UiFeature__push_notifications_developer',
  PUSH_NOTIFICATIONS = 'UiFeature__push_notifications',
  ML_SUGGESTED_EDIT = 'UiFeature__ml_suggested_edit',
  DIFF_FOR_USER_SUGGESTED_EDIT = 'UiFeature__diff_for_user_suggested_edit',
}
