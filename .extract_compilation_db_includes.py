#!/usr/bin/python

# If a build directory exists and it contains a compilation database json file,
# then extract all data for the file being opened by vim

import json
import os
import sys


def extractIncludesFromDB(directory, file_name):
    # Include all directories containing a header file of some sort
    # recursively, without manually adding them in to the flags
    # list
    include_paths = []

    for root, subdirs, files in os.walk(directory):
        subdirs[:] = [subdir for subdir in subdirs if "build" in subdir]
        files[:] = [file for file in files if file == "compile_commands.json"]

        if "build" not in root:
            continue

        if files:
            with open(root + "/" + files[0], "r") as f:
                data = json.load(f)

                for entry in data:
                    if file_name in entry["file"]:
                        return " ".join([
                            inc for inc in entry["command"].split()
                            if inc.startswith("-I")
                        ])

                break

    return include_paths


if __name__ == "__main__":
    project_dir = sys.argv[1]
    file_name = sys.argv[2]

    includes = extractIncludesFromDB(project_dir, file_name)

    if includes:
        print(includes)
