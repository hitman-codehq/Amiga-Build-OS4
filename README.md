# Build Amiga Docker Action

Builds a single C or C++ file, or a makefile-based project for Amiga OS3 or OS4.

## Inputs

## `command`

The command to execute to build the target.  Default is "make".

## `directory`

The directory in which to build the target.  Default is the current directory.  This is useful as GitHub actions
execute in the job's current directory, but a job might have multiple repos checked out into multiple subdirectories
under that.  This parameter allows building a project under one of those subdirectories.

## Outputs

There are no explicit outputs from the action.  Target object files, libraries and executables will be in the same
locations they would be in if the job was built locally.  They can be accessed by subsequent steps of the job in
order to upload them, create a release etc.

## Example Usage

```
name: Build
uses: hitman-codehq/Build-Amiga@v1
env:
  PREFIX: m68k-amigaos-
with:
  command: make
  directory: RADRunner
````

## See Also

Usage of this GitHub action can be slightly tricky (like all GitHub actions!), especially if you are new to creating
workflows and jobs on GitHub.  It is used by many Code HQ projects, so take a look at some Code HQ projects to see
an example.

An example of building a library for Amiga OS3 can be found [here](https://github.com/hitman-codehq/StdFuncs/blob/master/.github/workflows/amiga.yml).
This library is used by all Code HQ Amiga projects, and the workflow will show how to build a library and to upload
it to a place where it can be used as a depdendency by other projects.

An example of using the library mentioned above can be found [here](https://github.com/hitman-codehq/RADRunner/blob/master/.github/workflows/amiga.yml).
This workflow will checkout the library's repo (so that it can include its header files), will fetch the debug and
release versions of the library that were build by the above workflow, will build the RADRunner application, and will
then create a "latest build" release that people can download.

Creating these workflows was quite tedious and error prone - I encourage you to copy these for your own use!
