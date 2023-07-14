# MoxDemo

This project serves as a demo / tutorial for the
[Mox](https://hexdocs.pm/mox/Mox.html) library. It is structured as
a set of failing tests which you can work through to learn about Mox's
features in a progressive manner.

## Running The Demo

Since this demo is structured as a set of tests, running it is as easy as
running any suite of ex_unit tests:

```elixir
git clone git@github.com/mtrudel/mox_demo
cd mox_demo
mix deps.get
mix test
```

At this point you should see a single failing test (`TEST 1: Mocking Simple Functions`). Open up
`test/mox_demo_test.exs` in your editor and follow along to the instructions
therein. Once you make your way to the end of that file, you're done!
