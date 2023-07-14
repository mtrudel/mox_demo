defmodule MoxDemo.ExternalWeatherAPI do
  @behaviour MoxDemo.WeatherAPI

  # In reality, this would of course go out to some external service
  @impl true
  def temp(_lat_long), do: {:ok, 20}

  # In reality, this would of course go out to some external service
  @impl true
  def humidity(_lat_long), do: {:ok, 50}
end
