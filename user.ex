defmodule User do

  @spec initials(name: String.t()) :: String.t()
  def initials(name), do: select_initials(name)

  @spec select_initials(name: String.t()) :: String.t()
  def select_initials(name) when name == nil or name == "", do: "?"
  def select_initials(name) when is_string(name) do
    name
    |> String.split(" ")
    |> Enum.map_join(&String.first/1)
  end

end