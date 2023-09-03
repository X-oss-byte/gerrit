#!/usr/bin/env python3

# This script will be run by bazel when the build process starts to
# generate key-value information that represents the status of the
# workspace. The output should be like
#
# KEY1 VALUE1
# KEY2 VALUE2
#
# If the script exits with non-zero code, it's considered as a failure
# and the output will be discarded.

from __future__ import print_function
import os
import subprocess
import sys

ROOT = os.path.abspath(__file__)
while not os.path.exists(os.path.join(ROOT, 'WORKSPACE')):
    ROOT = os.path.dirname(ROOT)
CMD = ['git', 'describe', '--always', '--match', 'v[0-9].*', '--dirty']


def revision(directory, parent):
    try:
        os.chdir(directory)
        return subprocess.check_output(CMD).strip().decode("utf-8")
    except OSError as err:
        print(f'could not invoke git: {err}', file=sys.stderr)
        sys.exit(1)
    except subprocess.CalledProcessError as err:
        # ignore "not a git repository error" to report unknown version
        return None
    finally:
        os.chdir(parent)


print(f"STABLE_BUILD_GERRIT_LABEL {revision(ROOT, ROOT)}")
for kind in ['modules', 'plugins']:
    kind_dir = os.path.join(ROOT, kind)
    for d in os.listdir(kind_dir):
        p = os.path.join(kind_dir, d)
        if os.path.isdir(p):
            v = revision(p, ROOT)
            print(
                f"STABLE_BUILD_{os.path.basename(p).upper()}_LABEL {v if v else 'unknown'}"
            )
