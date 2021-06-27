# CPython 3.10.0 Beta 3.

<div align="left">
        <img
            alt="PHP Logo"
            title="PHP Logo"
            src="https://www.python.org/static/img/python-logo.png" />
</div>

Released in 32 bits and 64 bits, place inside C:\cpython\

# This is Python version 3.10.0 beta 3

<div align="left">
        <a href="https://travis-ci.com/python/cpython" target="_new">
        <img
            alt="CPython build status on Travis CI"
            title="CPython build status on Travis CI"
            src="https://travis-ci.com/python/cpython.svg?branch=master" />
        </a>
        <a href="https://github.com/python/cpython/actions" target="_new">
        <img
            alt="CPython build status on GitHub Actions"
            title="CPython build status on GitHub Actions"
            src="https://github.com/python/cpython/workflows/Tests/badge.svg" />
        </a>
        <a href="https://dev.azure.com/python/cpython/_build/latest?definitionId=4&branchName=master" target="_new">
        <img
            alt="CPython build status on Azure DevOps"
            title="CPython build status on Azure DevOps"
            src="https://dev.azure.com/python/cpython/_apis/build/status/Azure%20Pipelines%20CI?branchName=master" />
        </a>
        <a href="https://discuss.python.org/" target="_new">
        <img
            alt="Python Discourse chat"
            title="Python Discourse chat"
            src="https://img.shields.io/badge/discourse-join_chat-brightgreen.svg" />
        </a>
</div>
<br />
<br />
Copyright (c) 2001-2021 Python Software Foundation.  All rights reserved.
<br />
<br />
See the end of this file for further copyright and license information.

# Contents

# Configure variables

On Windows 10, right-click on File Explorer, This Pc, Properties.
Maximize Window, on the top right You should see: "Advanced System Settings".

Click on Environment Variables.

On System Variables, Click "New...".

Now on Variable Name write: PYTHONPATH
And on Variable Value write: C:\cpython\
Now press on OK.

Then do the same again but this time.

Now on Variable Name write: PYTHONHOME
And on Variable Value write: C:\cpython\
Now press on OK.

We need to double click on Variable: Path.
Once You double click on it add the next folders:

Press new and add:

C:\cpython\
C:\cpython\DLLs\
C:\cpython\Scripts\
C:\cpython\Lib\
C:\cpython\Lib\site-packages\

Now associate PYD, PYC and PY files to C:\cpython\python.exe

Reboot... that should do the work, revisit none other Python versions are on the "Path" folder, if so, remove any.
That is all the configuration You need to do, with the build I made.

# General Information

- Website: https://www.python.org
- Source code: https://github.com/python/cpython
- Issue tracker: https://bugs.python.org
- Documentation: https://docs.python.org
- Developer's Guide: https://devguide.python.org/

# Contributing to CPython

For more complete instructions on contributing to CPython development,
see the `Developer Guide`.

Developer Guide: https://devguide.python.org/

# Using Python

Installable Python kits, and information about using Python, are available at
`python.org`.

python.org: https://www.python.org/

# Build Instructions

On Unix, Linux, BSD, macOS, and Cygwin::

    ./configure
    make
    make test
    sudo make install

This will install Python as ``python3``.

You can pass many options to the configure script; run ``./configure --help``
to find out more.  On macOS case-insensitive file systems and on Cygwin,
the executable is called ``python.exe``; elsewhere it's just ``python``.

Building a complete Python installation requires the use of various
additional third-party libraries, depending on your build platform and
configure options.  Not all standard library modules are buildable or
useable on all platforms.  Refer to the
`Install dependencies <https://devguide.python.org/setup/#install-dependencies>`
section of the `Developer Guide`_ for current detailed information on
dependencies for various Linux distributions and macOS.

On macOS, there are additional configure and build options related
to macOS framework and universal builds.  Refer to `Mac/README.rst
<https://github.com/python/cpython/blob/master/Mac/README.rst>`.

On Windows, see `PCbuild/readme.txt
<https://github.com/python/cpython/blob/master/PCbuild/readme.txt>`.

If you wish, you can create a subdirectory and invoke configure from there.
For example::

    mkdir debug
    cd debug
    ../configure --with-pydebug
    make
    make test

(This will fail if you *also* built at the top-level directory.  You should do
a ``make clean`` at the top-level first.)

To get an optimized build of Python, ``configure --enable-optimizations``
before you run ``make``.  This sets the default make targets up to enable
Profile Guided Optimization (PGO) and may be used to auto-enable Link Time
Optimization (LTO) on some platforms.  For more details, see the sections
below.

# Profile Guided Optimization

PGO takes advantage of recent versions of the GCC or Clang compilers.  If used,
either via ``configure --enable-optimizations`` or by manually running
``make profile-opt`` regardless of configure flags, the optimized build
process will perform the following steps:

The entire Python directory is cleaned of temporary files that may have
resulted from a previous compilation.

An instrumented version of the interpreter is built, using suitable compiler
flags for each flavor. Note that this is just an intermediary step.  The
binary resulting from this step is not good for real-life workloads as it has
profiling instructions embedded inside.

After the instrumented interpreter is built, the Makefile will run a training
workload.  This is necessary in order to profile the interpreter's execution.
Note also that any output, both stdout and stderr, that may appear at this step
is suppressed.

The final step is to build the actual interpreter, using the information
collected from the instrumented one.  The end result will be a Python binary
that is optimized; suitable for distribution or production installation.


# Link Time Optimization

Enabled via configure's ``--with-lto`` flag.  LTO takes advantage of the
ability of recent compiler toolchains to optimize across the otherwise
arbitrary ``.o`` file boundary when building final executables or shared
libraries for additional performance gains.


# What's New

We have a comprehensive overview of the changes in the `What's New in Python
3.10 <https://docs.python.org/3.10/whatsnew/3.10.html>` document.  For a more
detailed change log, read `Misc/NEWS
<https://github.com/python/cpython/blob/master/Misc/NEWS.d>`, but a full
accounting of changes can only be gleaned from the `commit history
<https://github.com/python/cpython/commits/master>`.

If you want to install multiple versions of Python, see the section below
entitled "Installing multiple versions".


# Documentation

`Documentation for Python 3.10 <https://docs.python.org/3.10/>`_ is online,
updated daily.

It can also be downloaded in many formats for faster access.  The documentation
is downloadable in HTML, PDF, and reStructuredText formats; the latter version
is primarily for documentation authors, translators, and people with special
formatting requirements.

For information about building Python's documentation, refer to `Doc/README.rst
<https://github.com/python/cpython/blob/master/Doc/README.rst>`_.


# Converting From Python 2.x to 3.x

Significant backward incompatible changes were made for the release of Python
3.0, which may cause programs written for Python 2 to fail when run with Python
3.  For more information about porting your code from Python 2 to Python 3, see
the `Porting HOWTO <https://docs.python.org/3/howto/pyporting.html>`_.


Testing
-------

To test the interpreter, type ``make test`` in the top-level directory.  The
test set produces some output.  You can generally ignore the messages about
skipped tests due to optional features which can't be imported.  If a message
is printed about a failed test or a traceback or core dump is produced,
something is wrong.

By default, tests are prevented from overusing resources like disk space and
memory.  To enable these tests, run ``make testall``.

If any tests fail, you can re-run the failing test(s) in verbose mode.  For
example, if ``test_os`` and ``test_gdb`` failed, you can run::

    make test TESTOPTS="-v test_os test_gdb"

If the failure persists and appears to be a problem with Python rather than
your environment, you can `file a bug report <https://bugs.python.org>`_ and
include relevant output from that command to show the issue.

See `Running & Writing Tests <https://devguide.python.org/runtests/>`_
for more on running tests.

# Installing multiple versions

On Unix and Mac systems if you intend to install multiple versions of Python
using the same installation prefix (``--prefix`` argument to the configure
script) you must take care that your primary python executable is not
overwritten by the installation of a different version.  All files and
directories installed using ``make altinstall`` contain the major and minor
version and can thus live side-by-side.  ``make install`` also creates
``${prefix}/bin/python3`` which refers to ``${prefix}/bin/pythonX.Y``.  If you
intend to install multiple versions using the same prefix you must decide which
version (if any) is your "primary" version.  Install that version using ``make
install``.  Install all other versions using ``make altinstall``.

For example, if you want to install Python 2.7, 3.6, and 3.10 with 3.10 being the
primary version, you would execute ``make install`` in your 3.10 build directory
and ``make altinstall`` in the others.


# Issue Tracker and Mailing List

Bug reports are welcome!  You can use the `issue tracker
<https://bugs.python.org>` to report bugs, and/or submit pull requests `on
GitHub <https://github.com/python/cpython>`.

You can also follow development discussion on the `python-dev mailing list
<https://mail.python.org/mailman/listinfo/python-dev/>`.


# Proposals for enhancement

If you have a proposal to change Python, you may want to send an email to the
comp.lang.python or `python-ideas`_ mailing lists for initial feedback.  A
Python Enhancement Proposal (PEP) may be submitted if your idea gains ground.
All current PEPs, as well as guidelines for submitting a new PEP, are listed at
`python.org/dev/peps/ <https://www.python.org/dev/peps/>`.

python-ideas: https://mail.python.org/mailman/listinfo/python-ideas/


# Release Schedule

See :pep:`619` for Python 3.10 release details.


# Copyright and License Information

Copyright (c) 2001-2021 Python Software Foundation.  All rights reserved.

Copyright (c) 2000 BeOpen.com.  All rights reserved.

Copyright (c) 1995-2001 Corporation for National Research Initiatives.  All
rights reserved.

Copyright (c) 1991-1995 Stichting Mathematisch Centrum.  All rights reserved.

See the `LICENSE <https://github.com/python/cpython/blob/master/LICENSE>`_ for
information on the history of this software, terms & conditions for usage, and a
DISCLAIMER OF ALL WARRANTIES.

This Python distribution contains *no* GNU General Public License (GPL) code,
so it may be used in proprietary projects.  There are interfaces to some GNU
code but these are entirely optional.

All trademarks referenced herein are property of their respective holders.
