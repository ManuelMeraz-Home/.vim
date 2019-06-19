#! /usr/bin/env python3
import os
import platform
import sys
from distutils.sysconfig import get_python_inc

import ycm_core
sys.path.append(os.environ.get("HOME") + "/.vim/")
from includes_from_build import *

project_path = ""
project_include_dirs = ""

if os.environ.get("PROJECT"):
    project_path = os.environ.get("PROJECT")

if os.environ.get("PROJECT_INCLUDE_DIRS"):
    project_include_dirs = os.environ.get("PROJECT_INCLUDE_DIRS").split()

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
flags = [
    "-Wall",
    "-Wextra",
    "-Werror",
    "-Wno-variadic-macros",
    "-fexceptions",
    "-DNDEBUG",
    # You 100% do NOT need -DUSE_CLANG_COMPLETER and/or -DYCM_EXPORT in your
    # flags; only the YCM source code needs it.
    "-DUSE_CLANG_COMPLETER",
    "-DYCM_EXPORT=",
    # THIS IS IMPORTANT! Without the '-x' flag, Clang won't know which language
    # to use when compiling headers. So it will guess. Badly. So C++ headers
    # will be compiled as C headers. You don't want that so ALWAYS specify the
    # '-x' flag.  For a C project, you would set this to 'c' instead of 'c++'.
    "-x",
    "c++",
    get_python_inc(),
]

if project_include_dirs:
    flags = flags + project_include_dirs

# Clang automatically sets the '-std=' flag to 'c++14' for MSVC 2015 or later,
# which is required for compiling the standard library, and to 'c++11' for
# older versions.

if platform.system() != "Windows":
    flags.append("-std=c++17")

# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# You can get CMake to generate this file for you by adding:
#   set( CMAKE_EXPORT_COMPILE_COMMANDS 1 )
# to your CMakeLists.txt file.
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = project_path + "/build"

if os.path.exists(compilation_database_folder):
    database = ycm_core.CompilationDatabase(compilation_database_folder)
else:
    database = None

SOURCE_EXTENSIONS = [".cpp", ".cxx", ".cc", ".c", ".m", ".mm"]


def DirectoryOfThisScript():
    return os.path.dirname(os.path.abspath(__file__))


def IsHeaderFile(filename):
    extension = os.path.splitext(filename)[1]

    return extension in [".h", ".hxx", ".hpp", ".hh"]


def FindCorrespondingSourceFile(filename):
    if IsHeaderFile(filename):
        basename = os.path.splitext(filename)[0]

        for extension in SOURCE_EXTENSIONS:
            replacement_file = basename + extension

            if os.path.exists(replacement_file):
                return replacement_file

    return filename


def FlagsForFile(filename, **kwargs):
    return {
        "flags": flags + getAllIncludes(project_path, filename),
        "include_paths_relative_to_dir": DirectoryOfThisScript(),
        "override_filename": filename,
    }
