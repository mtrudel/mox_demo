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

  def display_temp_in_toronto_and_san_francisco do
    {:ok, toronto_temp} = MoxDemo.WeatherAPI.temp({43.6532, 79.3832})
    {:ok, san_francisco_temp} = MoxDemo.WeatherAPI.temp({37.7749, 122.4194})

    "Current temperature in Toronto is #{toronto_temp}°; while it is #{san_francisco_temp}° in San Francisco"
  end
end
