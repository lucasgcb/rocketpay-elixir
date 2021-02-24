defmodule Rocketpay.User do
    use Ecto.Schema
    import Ecto.Changeset
    alias Ecto.Changeset
    
    @primary_key {:id, :binary_id, autogenerate: true}
    @required_params [:name, :age, :email, :password, :nickname]
    schema "users" do
      field :name, :string
      field :age, :integer
      field :email, :string
      field :password, :string, virtual: true #Does not record txt password
      field :password_hash, :string
      field :nickname, :string

      timestamps()
    end

    def changeset(params) do
        # this function maps and validates our table input
        %__MODULE__{} # empty struct we will put every function return into
        |> cast(params, @required_params) # Will attempt to type cast input data
        |> validate_required(@required_params)
        # Check if password has at least 6 characters
        |> validate_length(:password_hash, min: 6) 
        # etc
        |> validate_number(:age, greater_than_or_equal_to: 18) 
        # validated email format through regex
        |> validate_format(:email, ~r/@/)
        |> unique_constraint([:email])
        |> unique_constraint([:nickname])
        |> put_password_hash()
    end

    defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
        change(changeset, Bcrypt.add_hash(password))
    end

    defp put_password_hash(changeset), do: changeset
end