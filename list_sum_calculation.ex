defmodule ListSumCalculation do

  @doc"""
  	sum_calculation_1 - is a function that calculates the sum of all elements list.
  	The main specific of this function is that it works with tail recursion.
  	In the each iteration we select first element from list -> check if it a list,
  	if `yes` -> calculate sum of this list
  	if `no` -> add this value to the acc
  	go to the next iteration

  	If list is empty -> function returns result

  	Examples:

  	iex> ListSumCalculation.sum_calculation_1([1,[2, [3, [4]]]])
  	8
  	iex> ListSumCalculation.sum_calculation_1([1, 2, 3, 4, 5, 6, 7])
  	28

  """
  @spec sum_calculation_1(numbers) :: result when
          numbers: list(),
          result: number()
  def sum_calculation_1(numbers), do: sum_calculation_1(numbers, 0)

  @spec sum_calculation_1(numbers, acc) :: result when
          numbers: list(),
          acc: number(),
          result: number()
  defp sum_calculation_1([], acc), do: acc
  defp sum_calculation_1([head|tail], acc) when is_list(h) do
    res = sum_calculation_1(head, 0)
    sum_calculation_1(tail, res + acc)
  end
  defp sum_calculation_1([head|tail], acc), do: sum_calculation_1(tail, head + acc)

  @doc"""
  	sum_calculation_2 - is a function that calculates the sum of all elements list.
  	In the first step I flattens the given list of nested lists.
  	In the second step I calculate sum of nested lists

  	Examples:

  	iex> ListSumCalculation.sum_calculation_2([1,[2, [3, [4]]]])
  	8
  	iex> ListSumCalculation.sum_calculation_2([1, 2, 3, 4, 5, 6, 7])
  	28

  """
  @spec sum_calculation_2(numbers) :: result when
          numbers: list(),
          result: number()
  def sum_calculation_2(numbers) do
    numbers
    |> List.flatten()
    |> Enum.sum()
  end

  # Conclusion:
  # The second variant more readable and have logical steps.
  # But based on that we use Enum module in the second variant the first variant with simple tail recursion should be faster

end
