#!/bin/sh

for c in 282828 2e2e2e 303030 353535 505050 909090 ffffff
do
	filename=swatch-$c.png
	printf '%b\n' "  GEN   $filename"
	sed s/deadbeef/$c/ swatch.svg > tmp.svg
	rsvg-convert tmp.svg > $filename
done

for c in eeeeee 444444 eeeeee af0000 008700 5f8700 0087af 878787 005f87 764e37 bcbcbc d70000 d70087 8700af d75f00 d75f00 4c7a5d 005faf
do
	filename=swatch-$c.png
	printf '%b\n' "  GEN   $filename"
	sed s/deadbeef/$c/ swatch.svg > tmp.svg
	rsvg-convert tmp.svg > $filename
done

rm -f tmp.svg
