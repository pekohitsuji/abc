#!/bin/bash
# -*- coding: utf-8-unix; mode: shell-script; sh-basic-offset: 2 -*-

if [ $# = 0 ] ; then
  out=README.md
else
  out=${1}
  shift
fi

cat <<EOF > ${out}
<!-- -*- coding: utf-8-unix; mode: markdown -*- -->

[FEATURES](FEATURES.md)

EOF

for x in $(find -name "*.htm" | sort) ; do
  if [ $x = "./template.htm" ] ; then continue ; fi
  base=$(basename $x)
  echo \[${base%.htm}\]\($x\) >> ${out}
done

cat ${out}
