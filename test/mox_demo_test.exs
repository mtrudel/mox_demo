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

  #
  # TEST 1: Mocking Simple Functions
  #
  # This test shows you how to mock simple functions with simple responses. 
  #
  # This test is currently failing since we don't have mocks defined for all of the functions
  # that `display_humidity/1` needs to do its job.
  #
  # To make this test pass, take a look at the implementation of `MoxDemo.display_humidity/1` and
  # determine which functions you might need to add to the `MoxDemo.MockWeatherAPI` mock, and then
  # add them.
  #
  # HINTS:
  #
  # 1. You'll need to add an expectation to the MockWeatherAPI mock to support calling the
  # `humidity/1` function. It should return a humidity of 100% (ie: `{:ok, 100}`)
  # 2. We already have a mock defined for temp; humidity should look very similar to this
  #

  test "TEST 1: Mocking Simple Functions" do
    expect(MoxDemo.MockWeatherAPI, :temp, fn _ ->
      {:ok, -34}
    end)

    assert MoxDemo.display_temp({0, 0}) == "Current temperature is -34°"
    # Your job is to make the following assertion pass
    assert MoxDemo.display_humidity({0, 0}) == "Current humidity is 100%"
  end
end
