defmodule MoxDemo.WeatherAPI do
  @callback temp({float(), float()}) :: {:ok, integer()}
  @callback humidity({float(), float()}) :: {:ok, integer()}

  def temp(lat_long), do: impl().temp(lat_long)
  def humidity(lat_long), do: impl().humidity(lat_long)
  defp impl, do: Application.get_env(:mox_demo, :weather, MoxDemo.ExternalWeatherAPI)
end
