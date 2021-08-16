
defmodule SentimentAnalyzer.GNLP do

  def analyze(text, scope)do
    %{"tweet" => text, "feedback" => process_request(build_uri(scope), build_params(text))}
  end
  defp process_request(uri, params)do
    IO.inspect uri
    case HTTPoison.post uri, params, [{"Content-Type", "application/json"}] do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        body
      _ -> nil
    end
  end
  defp build_uri(scope)do
    scope = scope |> Atom.to_string() |> String.capitalize()
    "https://language.googleapis.com/v1/documents:analyze#{scope}?key=AIzaSyDoXEENN5Is7_Hpu-SER_bp92yBI4DJGmg"
  end
  defp build_params(text)do
    %{
      "document" => %{
        "type" => "PLAIN_TEXT",
        "content" => text
      },
      "encodingType" => "UTF8"
    }
    |> Jason.encode!()
  end

end
