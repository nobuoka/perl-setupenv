#!/bin/sh
echo "1..1"
basedir=$(cd `dirname $0`/../.. && pwd)
pmbp=$basedir/bin/pmbp.pl
tempdir=`perl -MFile::Temp=tempdir -e 'print tempdir'`/testapp

mkdir -p "$tempdir"

perl $pmbp --root-dir-name "$tempdir" \
    --perl-version 5.20 \
    --install-perl \
    --install-perl-app https://github.com/kentaro/cinnamon

((cd "$tempdir/local/cinnamon" && ./carton exec -- perl -Ilib bin/cinnamon --help) && echo "ok 1") || echo "not ok 1"

rm -fr "$tempdir"
