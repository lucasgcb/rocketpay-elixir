defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    # Attempt to read file, pass return to handler
    #file = File.read("#{filename}.csv")
    #handle_file(file)

    #Same thing, but in pipe operator format
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end
  
  # Handle return from File.read
  #defp handle_file({:ok, result}), do: file # Show matched for "file"
  defp handle_file({:ok, result}) do
    #result = String.split(result,",")
    #result = Enum.map(result, fn number -> String.to_integer(number) end)
    #result = Enum.sum(result)
    result=
      result
      |> String.split(",")
      |> Stream.map(fn number -> String.to_integer(number) end)
      |> Enum.sum()
    {:ok, %{result: result}}
  end
  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid File!"}}
end
