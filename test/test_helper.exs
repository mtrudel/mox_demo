ExUnit.start()

# Mox requires that mocks be defined against an existing behaviour; this is to help ensure that
# your mocks adhere to the interface that your actual implementation uses. 
#
# On the following line, we are declaring that the `MoxDemo.MockWeatherAPI` module is expected to
# mock the behaviour described in the `MoxDemo.WeatherAPI` behaviour. Mox will raise an error if 
# we attempt to mock a function that is not declared as a `@callback` within the
# `MoxDemo.WeatherAPI` behaviour
Mox.defmock(MoxDemo.MockWeatherAPI, for: MoxDemo.WeatherAPI)

# This line sets the appropriate application environment such that calls to the private
# `MoxDemo.WeatherAPI.impl/0` function will return the `MoxDemo.MockWeatherAPI` module we defined
# above
Application.put_env(:mox_demo, :weather, MoxDemo.MockWeatherAPI)
