defmodule Tweet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tweets" do
    field :feedback, :string     # Defaults to type :string
    timestamps()
  end

  def changeset(record, params \\ :empty) do
    record
    |> cast(params, [:feedback])
  end

  def create_record(params)do
    Tweet.changeset(%Tweet{}, params) |> Backpressure.Repo.insert()
  end
end
