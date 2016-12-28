# cube-stats

## Naive analysis of Rubik's cube competitions

So here's the theory:
Two expert solvers sit down at a table. On the table there are two randomly scrambled
Rubik's cubes. Now, one might be easy to solve and one might be hard to solve.
Both of them could be hard. Or both of them could be easy. It's all random anyways.

So what's the distribution of solve times for randomly scrambled cubes? Given a
naive _computerized_ solver, we can figure this out. It is relatively easy to
program a solver -- however a _computerized_ solver does not solve a cube
in the manner that a human would, so this simulation is flawed in that regard.

But we can still attempt to uncover how much of solving competitions is based
on pure luck. Judge the results for yourself.

![dist results](https://raw.githubusercontent.com/ryanmjacobs/cube-stats/master/screenshot.png)
