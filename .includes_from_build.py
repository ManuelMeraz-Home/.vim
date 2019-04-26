#!/usr/bin/python

'''
Extract include_dirs information from a compilation database file and
also from conan build info file
'''

import json
import os
import sys


def parseCompileCompilationsDB(database):
    '''
    @brief extract all include directories from the compilation database
           for the file we're analyzing

    @param database The full path to the database file
    @type  database string
    '''
    with open(database, "r") as f:
        data = json.load(f)

        for entry in data:
            if file_name in entry["file"]:

                include_dirs = [
                    inc for inc in entry["command"].split()
                    if inc.startswith("-I")
                ]

    return include_dirs


def parseConanBuildInfo(conanbuildinfo):
    '''
    @brief extract all include directories from the conan build info file

    @param conanbuildinfo The full path to the database file
    @type  conanbuildinfo string
    '''
    include_dirs = []
    with open(conanbuildinfo, "r") as f:
        include_dirs_begin = False

        for line in f:
            # Got to the end of reading include_dirs

            if include_dirs_begin and line == "\n":
                break

            if include_dirs_begin:
                include_dirs.append("-I" + line.rstrip())

            if "[includedirs]" in line:
                include_dirs_begin = True

    return include_dirs


def extractIncludes(directory, file_name):
    '''
    @brief search a project directory for a build directory and extract
           build information from a compilation database file

    @param directory The full project directory path
    @type  directory string

    @param file_name The name of the file (e.g. main.cpp)
    @type  file_name string
    '''

    file_handlers = {
        "compile_commands.json": parseCompileCompilationsDB,
        "conanbuildinfo.txt": parseConanBuildInfo,
    }

    include_dirs = []

    for root, subdirs, files in os.walk(directory):
        subdirs[:] = [subdir for subdir in subdirs if "build" in subdir]
        files[:] = [file for file in files if file in file_handlers.keys()]

        if "build" not in root:
            continue

        for file in files:
            handler = file_handlers[file]
            include_dirs = include_dirs + handler(os.path.join(root, file))

    return list(set(include_dirs))


def getIncludeRecursively(include_dir):
    nested_include_dirs = []

    for root, subdirs, files in os.walk(include_dir.lstrip("-I")):
        for subdir in subdirs:
            nested_include_dirs.append("-I" + os.path.join(root, subdir))

    return nested_include_dirs


if __name__ == "__main__":
    project_dir = sys.argv[1]
    file_name = sys.argv[2]

    # find build directory and pull out build info containing includes
    include_dirs = extractIncludes(project_dir, file_name)

    # Get any directories within the includes
    nested_include_dirs = []
    for dir in include_dirs:
        nested_include_dirs = nested_include_dirs + getIncludeRecursively(dir)

    include_dirs = include_dirs + nested_include_dirs
    if include_dirs:
        print(" ".join(include_dirs))
