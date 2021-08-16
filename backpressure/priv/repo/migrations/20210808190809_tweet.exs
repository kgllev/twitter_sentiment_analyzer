defmodule Backpressure.Repo.Migrations.Tweet do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :feedback, :text     # Defaults to type :string
      timestamps()
    end
  end
end
