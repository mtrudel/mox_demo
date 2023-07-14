defmodule MoxDemo do
  @moduledoc false

  def display_temp({lat, long}) do
    {:ok, temp} = MoxDemo.WeatherAPI.temp({lat, long})
    "Current temperature is #{temp}°"
  end

  def display_humidity({lat, long}) do
    {:ok, humidity} = MoxDemo.WeatherAPI.humidity({lat, long})
    "Current humidity is #{humidity}%"
  end
end
