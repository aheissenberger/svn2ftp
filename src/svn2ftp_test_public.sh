#!/bin/sh

. ./svn2ftp_test_helpers

testDeploymentTypeFails()
{
	echo "${SHUNIT_TMPDIR}"
	svn propget svn2ftp_server $svncheckout
	svn propset svn2ftp_server "xtp://user:password@test.local/path" $svncheckout
	${svn2ftpCmd} "${svncheckout}" >${stdoutF} 2>${stderrF}
	rtrn=$?
	assertFalse 'expecting return code of 1 (false)' ${rtrn}
	assertNull 'unexpected output to stdout' "`cat ${stdoutF}`"
	assertNotNull 'expected error message to stderr' "`cat ${stderrF}`"

	assertTrue 'directory missing' "[ -d '${testDir}' ]"
}



oneTimeSetUp()
{
  outputDir="${SHUNIT_TMPDIR}/output"
  svnsrcdir="${outputDir}/svn"
  svnsrc="$svnsrcdir/test"
  svncheckout="${outputDir}/svncheckout"
  stdoutF="${outputDir}/stdout"
  stderrF="${outputDir}/stderr"

  svn2ftpCmd='svn2ftp'  # save command name in variable to make future changes easy
  ftpserver='ftp://xx.local/'
  testDir="${SHUNIT_TMPDIR}/some_test_dir"
  mkdir -p $svnsrcdir
  svnadmin create $svnsrc
  mkdir -p $svncheckout
  svn checkout file://$svnsrc $svncheckout 
  # $svncheckout
  #pushd $svncheckout
}

setUp()
{
	svn propset svn2ftp_server "$ftpserver" $svncheckout 
}

tearDown()
{
  rm -fr "${testDir}"
}
# load and run shUnit2
[ -n "${ZSH_VERSION:-}" ] && SHUNIT_PARENT=$0
. ${TH_SHUNIT}
