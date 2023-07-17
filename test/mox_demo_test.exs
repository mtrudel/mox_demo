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
  # THERE ARE NO WRONG ANSWERS! The whole point of this exercise is to get you familiar
  # with the Mox library, so whatever path you choose to take on that journey is fine! Good 
  # luck!
  # 
  # If you get stuck, or want to jump right to the end, the `shortcuts` branch of this repo
  # contains passing versions of these tests.
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

    # This assertion already passes, so as to demonstrate what a complete mock setup looks like
    # for the `temp/1` function
    assert MoxDemo.display_temp({0, 0}) == "Current temperature is -34°"

    # Your job is to make the following assertion pass
    assert MoxDemo.display_humidity({0, 0}) == "Current humidity is 100%"
  end

  #
  # TEST 2: Making your mocks callable multiple times
  #
  # This test shows you how to make your mocks callable multiple times.
  # 
  # By default, mocks are *validating*, which means that they validate that they get called during
  # your test. Mox will ensure that each mock is called the expected number of times (1 by
  # default) within each test, and will fail the test if this is not the case (In the next test
  # we'll see a variation of mocks called 'stubs' which solve this problem in a different way).
  #
  # This test is currently failing since our `display_temp_in_toronto_and_san_francisco/0`
  # function calls the Weather API twice; once for each city.
  #
  # To make this test pass, we'll want to update our `temp/1` mock to be callable multiple times
  # (twice in this example). Don't worry about returning sensible data for each location; we'll
  # get to that in a later test.
  #
  # HINTS:
  #
  # 1. Take a look at the documentation for [Mox.expect/4](https://hexdocs.pm/mox/Mox.html#expect/4)
  #    to see how to get Mox to allow a mock to be called multiple times.
  #

  # IMPORTANT! Remove / comment out the following `@tag :skip` line to start running this test
  @tag :skip
  test "TEST 2: Making your mocks callable multiple times" do
    expect(MoxDemo.MockWeatherAPI, :temp, fn _ ->
      {:ok, -34}
    end)

    assert MoxDemo.display_temp_in_toronto_and_san_francisco() ==
             "Current temperature in Toronto is -34°; while it is -34° in San Francisco"
  end

  #
  # TEST 3: Making your mocks callable multiple times using stubs
  #
  # This test shows you how to make your mocks callable multiple times by using stubs instead of
  # mocks
  # 
  # As we saw in the previous test, mocks are *validating*, which means that they will ensure that
  # they are called the expected number of times (1 by default) and will fail the test if this is
  # not the case. This is useful behaviour in most cases, but sometimes you want to just let your
  # code call a mocked function as often as it wants to. This is where stubs come in.
  #
  # Stubs are basically just mocks that do not validate. A stub acts exactly like a mock does,
  # expect that it can be called any number of times (including 0!) without error.
  #
  # Mox supports declaring stubs using the [Mox.stub/3](https://hexdocs.pm/mox/Mox.html#stub/3) function.
  #
  # This test is currently failing since our `display_temp_in_toronto_and_san_francisco/0`
  # function calls the Weather API twice; once for each city.
  #
  # To make this test pass, we'll want to implement a stub for `temp/1`, using the `Mox.stub/3`
  # function to register the stub. Don't worry about returning sensible data for each location;
  # we'll get to that in a later test.
  #
  # HINTS:
  #
  # 1. `Mox.stub/3` behaves the exact same way as `Mox.expect/4` does, just without validating the
  #    number of times it gets called
  #

  # IMPORTANT! Remove / comment out the following `@tag :skip` line to start running this test
  @tag :skip
  test "TEST 3: Making your mocks callable multiple times using stubs" do
    assert MoxDemo.display_temp_in_toronto_and_san_francisco() ==
             "Current temperature in Toronto is -34°; while it is -34° in San Francisco"
  end

  #
  # TEST 4: Making your mocks handle input parameters
  #
  # This test shows you how to mock functions that make use of their input parameters.
  #
  # This test is currently failing since our mocked `temp/1` function always returns the same
  # temperature value. As a result we're seeing the same temperature in both Toronto and San
  # Francisco.
  #
  # To make this test pass, we'll want to improve our `temp/1` mock to return hotter temperatures 
  # closer to the equator. This will demonstrate that the `MoxDemo.display_temperature/1` function
  # is actually passing along the lat/long parameters to the Weather API.
  #
  # HINTS:
  #
  # 1. We're taking a simplistic view of weather; any location with a latitude between -40 and +40
  #    degrees of latitude should have a temperature of 20°, and any point further away than 40
  #    degrees from the equator should have a temperature of 15°.
  #

  # IMPORTANT! Remove / comment out the following `@tag :skip` line to start running this test
  @tag :skip
  test "TEST 4: Making your mocks handle input parameters" do
    expect(MoxDemo.MockWeatherAPI, :temp, 2, fn {_lat, _long} ->
      {:ok, 20}
    end)

    assert MoxDemo.display_temp_in_toronto_and_san_francisco() ==
             "Current temperature in Toronto is 15°; while it is 20° in San Francisco"
  end
end
