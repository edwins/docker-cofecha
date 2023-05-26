# docker-cofecha
This is a minimal dockerized version of [cofecha](https://www.ltrr.arizona.edu/pub/dpl/) running in [wine](https://www.winehq.org/). This docker file is very much a proof-of-concept to test out the feasibility of automating the tool, and uses the `MEASURE2.DTA` file that was found in the tree ring research laboratory repository page in the `SAMPLE.ZIP`.

If you want to change the input values sent to cofecha, take a look at the `entrypoint.sh` file and the modify.

The next step for this proof-of-concept would be to add this into a kubernetes with some sort of trigger, such as monitoring for input files from a cloud storage or processing the files that a user submits through a web frontend.

Here is an example command to run this container, passing an input file:

```
docker run --platform linux/i386 --mount type=bind,source="$(pwd)"/MEASURE2.DTA,target=/data/MEASURE2.DTA,readonly cofecha 0 MEASURE2.DTA test-title
```
