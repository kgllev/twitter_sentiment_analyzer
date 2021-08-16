defmodule SentimentAnalyzer.Twitter do
  alias SentimentAnalyzer.GNLP
  alias SentimentAnalyzer.Producer

  def analyze_and_produce()do
    ["cats", "dogs"]
    |> Enum.random()
    |> stream()

  end

  defp stream(topic)do
    {:ok, pid} = SentimentAnalyzer.Producer.start_link()
    stream = ExTwitter.stream_filter(track: topic)
             |> Stream.map(
                  fn (x) ->
                    IO.inspect x.text
                    message = x.text |> GNLP.analyze(:sentiment) |> Jason.encode!()
                    Producer.send_message(pid, message)
                  end
                )
    Enum.to_list(stream)
  end
end
