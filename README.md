svn2ftp
=======

bash script to incremental upload changes in subversion repositories to ftp server

Installation
============

Requires:
* curl for FTP upload
* bash
* svn

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