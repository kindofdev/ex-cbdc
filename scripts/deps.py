#!/usr/bin/env python3

from glob import glob
import os
import re
import subprocess
import sys

base_dir = sys.argv[1]

def get_deps(package):
  deps = subprocess.run(["yq", ".data-dependencies[]", os.path.join(package, 'daml.yaml')], stdout=subprocess.PIPE, text=True).stdout.split()
  for dep in deps:
    result = re.search('^.lib/([^\s/]+)/([^\s]+)/([^\s/]+)$', dep)
    if not result: continue
    (repo, release, file) = result.groups()

    output_dir = os.path.join(base_dir, '.lib', repo, release)
    output_file = os.path.join(output_dir, file)
    if os.path.isfile(output_file):
      print(f"Using existing {output_file}")
    else:
      print(f"Fetching {output_file}")
      os.system(f"mkdir -p {output_dir}")
      os.system(f"curl -Lf# https://github.com/digital-asset/{repo}/releases/download/{release}/{file} -o {output_file}")

for package in glob(f"{base_dir}/package/main/daml/*/"):
  get_deps(package)
  os.system(f"rm -f \"{os.path.join(package, '.lib')}\"")
  os.system(f"ln -s \"{os.path.join(os.path.relpath(base_dir, package), '.lib')}\" \"{os.path.join(package, '.lib')}\"")
get_deps(base_dir)