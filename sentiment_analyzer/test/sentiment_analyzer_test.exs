defmodule SentimentAnalyzerTest do
  use ExUnit.Case
  doctest SentimentAnalyzer

  test "greets the world" do
    assert SentimentAnalyzer.hello() == :world
  end
end
