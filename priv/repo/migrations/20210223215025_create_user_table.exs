defmodule Rocketpay.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    create table :users do
      #id is created implicitly
      add :name, :string
      add :age, :integer
      add :email, :string
      add :password_hash, :string
      add :nickname, :string

      timestamps() #Adds 2 columns: inserted_at, updated_at
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:nickname])
  end
end
