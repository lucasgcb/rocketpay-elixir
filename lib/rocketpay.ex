defmodule Rocketpay do
 # Define facade for create_user ( Rocketpay.create_user )
 alias Rocketpay.Users.Create, as: UserCreate

 defdelegate create_user(params), to: UserCreate, as: :call
 
end
