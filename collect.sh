#!/bin/bash
while true ; do 
    for energy in electricity gas ; do 
        date=$(date +%s)
        touch $energy
        ./recent.sh $energy.consumption > $energy.$(date +%s) 
        cat $energy $energy.* | sort -n | awk '{this = $1; if (last != this) {printf("%d\t%f\n", last, maxi);last=this;maxi=0.0;} else if ($2 > maxi) {maxi = $2;}; last = $1;}' | sponge $energy
        octave plot.m $energy
    done
    sleep $(( 30 * 60 ))
done
