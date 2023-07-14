ExUnit.start()
Mox.defmock(MoxDemo.MockWeatherAPI, for: MoxDemo.WeatherAPI)
Application.put_env(:mox_demo, :weather, MoxDemo.MockWeatherAPI)

