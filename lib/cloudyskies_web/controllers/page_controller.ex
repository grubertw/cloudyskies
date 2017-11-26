defmodule CloudyskiesWeb.PageController do
  use CloudyskiesWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def ds_query(conn, %{"latitude" => lat, "longitude" => long}) do 
    # Get today's forcast
    currently = Darkskyx.current(lat, long)

    now = DateTime.utc_now |> DateTime.to_unix
    today = weather_info(now, currently)

    # Get weather history for the previous 7 days.
    history = Enum.map(1..6, fn x -> 
      time = DateTime.utc_now |> DateTime.to_unix
      time - (x * 86400)
    end) 
    |> Enum.reduce([today], fn (x, acc) ->
      {:ok, %{"currently" => currently}} = Darkskyx.time_machine(lat, long, x)
      weather = weather_info(x, currently)
      [weather | acc]
    end)

    render conn, "forecast.html", 
      [latitude: lat, longitude: long, forecast: Enum.reverse(history)]
  end 

  # extract weather info from Darkskyx API and format values for display.
  defp weather_info(time, currentWeather) do 
    %{"precipProbability" => precipProbability,
      "temperature" => temperature,
      "humidity" => humidity,
      "windSpeed" => windSpeed,
      "cloudCover" => cloudCover
    } = currentWeather
    ts = DateTime.from_unix!(time) |> to_string
    pp = round(precipProbability*100.0)
    h = round(humidity*100.0)
    cc = round(cloudCover*100.0)

    [ts, temperature, pp, h, windSpeed, cc]
  end 

end
