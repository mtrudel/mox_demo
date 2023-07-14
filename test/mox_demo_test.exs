defmodule MoxDemoTest do
  # 
  # RUNNING THIS DEMO
  #
  # The Mox demo is structured as a series of failing tests. You are expected to make each of
  # them pass one by one by following the hints given for each. 
  # 
  # The tests here are loosely based on the 'Weather API' examples that the Mox library uses in
  # its documentation.
  #
  # The tests in this module are testing the behaviour of the `MoxDemo` module. Since this module 
  # makes calls internally to the `MoxDemo.WeatherAPI` module to obtain weather information, we 
  # will need to build a mock to implement its behaviour in a test environment
  #
  # All of the tests except the first are skipped by default; as you work through the tests and
  # make them pass, remove the `@tag: :skip` line the following test to keep making progress!
  #
  # Each test has an overview and some hints to help you on your way. Consult the [Mox
  # docs](https://hexdocs.pm/mox/Mox.html) for details about how to use Mox.
  #
  # Good luck!
  #

  use ExUnit.Case
  import Mox
end
