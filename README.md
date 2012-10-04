svn2ftp
=======

bash script to incremental upload changes in subversion repositories to ftp/sftp server

How does it work
================

The configurations for the script are stored as properties in the svn root directory. this includes the target ftp server, username and password. The script will request the svn revision id of the last ftp files from the ftp server. Alle files newer will than be copied to the ftp server and the revision status file updated with the current revision.

Installation
============

Requires:
* curl for FTP upload
* bash
* svn

Operating Systems supported:
* OSX (tested)
* UNIX/Bash (not tested)

Make _svn2ftp_ executable:

	chmod +x svn2ftp
	
Add _svn2ftp_ to your PATH in /usr/local/bin

	cp svn2ftp /usr/local/bin
	
Setup
=====

Add the target ftp server to your SVN repository

	svn propset deploy 'ftp://<user>:<passwort>@<server>/<path>' .
	
Usage
=====

start on commandline

	svn2ftp <path to local svn checkout>
	
as a custom build setup in _sublime text 2_ projectname.sublime-project:

	{
		"folders":
		[
			{
				"path": "<path to project>"
			}
		],
		"build_systems":
	    [
	        {
	            "name": "svn2ftp",
	            "cmd": ["svn2ftp","$project_path"],
	            "path": "/Users/xx/bin/" // only relevant if _svn2ftp_ ist not in PATH
	        }
	    ]
	}

Note
====

To use the script with _sublime text 2_ the _bash_ needs to be called with this code to load the path to bin

	#!/bin/bash --login

TODO
====

* error handling
* copy all files if there is no /deploy/REVISION on the ftp server
