# docker-cofecha
This is a minimal dockerized version of [cofecha](https://www.ltrr.arizona.edu/pub/dpl/) running in [wine](https://www.winehq.org/). This docker file is very much a proof-of-concept to test out the feasibility of automating the tool, and uses the `MEASURE2.DTA` sample file that was found in the tree ring research laboratory repository page.

If you want to change the values sent to cofecha, take a look at the `entrypoint.sh` file and the modify.

Here is an example command to run this container, passing an input file:

```
docker run --platform linux/i386 --mount type=bind,source="$(pwd)"/MEASURE2.DTA,target=/data/MEASURE2.DTA,readonly cofecha 0 MEASURE2.DTA test-title
```
