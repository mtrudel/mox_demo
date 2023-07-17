defmodule MoxDemo.WeatherAPI do
  @callback temp({float(), float()}) :: {:ok, integer()}
  @callback humidity({float(), float()}) :: {:ok, integer()}

  # Public functions which use the application's configured implementation of the
  # `MoxDemo.WeatherAPI` behaviour described above to obtain the relevant temperature or humidity
  def temp(lat_long), do: impl().temp(lat_long)
  def humidity(lat_long), do: impl().humidity(lat_long)

  # Looks up an application environment-specific implementation of the `MoxDemo.WeatherAPI`
  # behaviour, defaulting to `MoxDemo.ExternalWeatherAPI`. This will be overridden in
  # `test_helper.exs` to use the mocked behaviour in the test environment
  defp impl, do: Application.get_env(:mox_demo, :weather, MoxDemo.ExternalWeatherAPI)
end
