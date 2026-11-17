#!/bin/sh

for c in 282828 2e2e2e 303030 353535 505050 909090 ffffff
do
	filename=swatch-$c.png
	printf '%b\n' "  GEN   $filename"
	sed s/deadbeef/$c/ swatch.svg > tmp.svg
	rsvg-convert tmp.svg > $filename
done

rm -f tmp.svg
