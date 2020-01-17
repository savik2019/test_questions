defmodule User do

  @spec initials(name) :: result when
          name: any(),
          result: String.t()
  def initials(name) when name == nil or name == "", do: "?"
  def initials(name) when is_binary(name) do
    name
    |> String.split(" ")
    |> select_initials()
  end
  def initials(_name), do: "Error, name should be a string"

  @spec select_initials(name) :: result when
          name: list(),
          result: String.t()
  defp select_initials([name]), do: String.first(name)
  defp select_initials([first_name, last_name]), do: select_initials(first_name, last_name)
  defp select_initials([first_name | names]), do: select_initials(first_name,  List.last(names))

  @spec select_initials(first_name, last_name) :: result when
          first_name: String.t(),
          last_name: String.t(),
          result: String.t()
  defp select_initials(first_name, last_name), do: String.first(first_name) <> String.first(last_name)
  
end
