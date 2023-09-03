#!/usr/bin/env python3
# Copyright (C) 2013 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from __future__ import print_function
import argparse
from os import path, environ
from subprocess import check_output, CalledProcessError
from sys import stderr

parser = argparse.ArgumentParser()
parser.add_argument('--repository', help='maven repository id')
parser.add_argument('--url', help='maven repository url')
parser.add_argument('-o')
parser.add_argument('-a', help='action (valid actions are: install,deploy)')
parser.add_argument('-v', help='gerrit version')
parser.add_argument('-s', action='append', help='triplet of artifactId:type:path')
args = parser.parse_args()

if not args.v:
    print('version is empty', file=stderr)
    exit(1)

root = path.abspath(__file__)
while not path.exists(path.join(root, 'WORKSPACE')):
    root = path.dirname(root)

if args.a == 'install':
    cmd = ['mvn', 'install:install-file', f'-Dversion={args.v}']
elif args.a == 'deploy':
    cmd = [
        'mvn',
        'gpg:sign-and-deploy-file',
        f'-Dversion={args.v}',
        f'-DrepositoryId={args.repository}',
        f'-Durl={args.url}',
    ]
else:
    print(f"unknown action -a {args.a}", file=stderr)
    exit(1)

for spec in args.s:
    artifact, packaging_type, src = spec.split(':')
    exe = cmd + [
        f"-DpomFile={path.join(root, 'tools', 'maven', f'{artifact}_pom.xml')}",
        f'-Dpackaging={packaging_type}',
        f'-Dfile={src}',
    ]
    try:
        if environ.get('VERBOSE'):
            print(' '.join(exe), file=stderr)
        check_output(exe)
    except Exception as e:
        print('%s command failed: %s\n%s' % (args.a, ' '.join(exe), e),
              file=stderr)
        if environ.get('VERBOSE') and isinstance(e, CalledProcessError):
            print('Command output\n%s' % e.output, file=stderr)
        exit(1)


out = open(args.o, 'w') if args.o else stderr
with out as fd:
    if args.repository:
        print(f'Repository: {args.repository}', file=fd)
    if args.url:
        print(f'URL: {args.url}', file=fd)
    print(f'Version: {args.v}', file=fd)
