#!/bin/sh
echo "1..2"
basedir=`dirname $0`/../..
pmbp=$basedir/bin/pmbp.pl
tempdir=`perl -MFile::Temp=tempdir -e 'print tempdir'`/testapp

(perl $pmbp --root-dir-name "$tempdir" \
    --perl-version latest \
    --install-perl --create-perl-command-shortcut perl && \
    echo "ok 1") || echo "not ok 1"

($tempdir/perl -e 'print "ok 2\n"') || echo "not ok 2"

rm -fr $tempdir
