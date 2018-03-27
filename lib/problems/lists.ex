defmodule NinetyNineProblems.Lists do
  @moduledoc """
  1. Lists [P1.01 ~ P1.10]
  """

  @doc """
  Lists part of 99 prolog problems.

  ## Examples

      iex> NinetyNineProblems.Lists.questions
      :"Lists [P1.01 ~ P1.10]"

  """
  def questions do
    :"Lists [P1.01 ~ P1.10]"
  end

  @doc """
  P1.01: Find the last element of a list.

  ## Examples

      iex> NinetyNineProblems.Lists.last_element([1,2,3])
      3

      iex> NinetyNineProblems.Lists.last_element([1])
      1

      iex> NinetyNineProblems.Lists.last_element([])
      :error

  """
  def last_element([]), do: :error
  def last_element([x]), do: x
  def last_element([_head | tail]), do: last_element(tail)

  @doc """
  P1.02: Find the last but one element of a list.

  ## Examples

      iex> NinetyNineProblems.Lists.last_but_one([0,1,2,3])
      2

      iex> NinetyNineProblems.Lists.last_but_one([0])
      :error

      iex> NinetyNineProblems.Lists.last_but_one([])
      :error

  """
  def last_but_one([head, _tail]), do: head
  def last_but_one([_head, middle | tail]), do: last_but_one([middle | tail])
  def last_but_one(_), do: :error

  @doc """
  P1.03: Find the K'th element of a list.

  ## Examples

    iex> NinetyNineProblems.Lists.kth_element([1,2,3,4,5], 3)
    4

    iex> NinetyNineProblems.Lists.kth_element([1], 0)
    1

    iex> NinetyNineProblems.Lists.kth_element([], 2)
    :error
  """
  def kth_element([head | _tail], 0), do: head
  def kth_element([_head | tail], index), do: kth_element(tail, index - 1)
  def kth_element(_, _), do: :error

  @doc """
  P1.04: Find the number of elements of a list.

  ## Examples

    iex> NinetyNineProblems.Lists.number_of_element([1,2,3,4,5])
    5

    iex> NinetyNineProblems.Lists.number_of_element([])
    0

    iex> NinetyNineProblems.Lists.number_of_element(1)
    :error
  """
  def number_of_element(list), do: number_of_element(list, 0)
  def number_of_element([_head | tail], n), do: number_of_element(tail, n + 1)
  def number_of_element([], n), do: n
  def number_of_element(_, _), do: :error

  @doc """
  P1.05: Reverse a list.

  ## Examples

    iex> NinetyNineProblems.Lists.reverse_list([1,2,3])
    [3,2,1]

    iex> NinetyNineProblems.Lists.reverse_list([1])
    [1]

    iex> NinetyNineProblems.Lists.reverse_list("other")
    :error

  """
  def reverse_list(list), do: reverse_list(list, [])
  defp reverse_list([head | tail], revarsed), do: reverse_list(tail, [head] ++ revarsed)
  defp reverse_list([], revarsed), do: revarsed
  defp reverse_list(_, _), do: :error

  @doc """
  P1.06: Find out whether a list is a palindrome.

  ## Examples

    iex> NinetyNineProblems.Lists.palindrome?([1,2,3])
    false

    iex> NinetyNineProblems.Lists.palindrome?([1,2,3,2,1])
    true

    iex> NinetyNineProblems.Lists.palindrome?([])
    true

  """
  def palindrome?(list), do: list === reverse_list(list)


  @doc """
  P1.07: Flatten a nested list structure.

  ## Examples

    iex> NinetyNineProblems.Lists.flatten_list([[1,2], 3, [4, 5]])
    [1,2,3,4, 5]

    iex> NinetyNineProblems.Lists.flatten_list([1,2,3,4])
    [1,2,3,4]

    iex> NinetyNineProblems.Lists.flatten_list(3)
    :error

  """
  def flatten_list([head | tail]) do
    case head do
      [_x | _y] -> flatten_list(head) ++ flatten_list(tail)
      _x -> [head] ++ flatten_list(tail)
    end
  end
  def flatten_list([]), do: []
  def flatten_list(_), do: :error


  @doc """
  P1.08: Eliminate consecutive duplicates of list elements.
  If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

  ## Examples

    iex> NinetyNineProblems.Lists.eliminate_duplicates(["a","a","a","a","b","c","c","a","a","d","e","e","e"])
    ["a","b","c","a","d","e"]

    iex> NinetyNineProblems.Lists.eliminate_duplicates(["a","b","c","a","d","e"])
    ["a","b","c","a","d","e"]

    iex> NinetyNineProblems.Lists.eliminate_duplicates([1,2,2,3,3,3,4,4,1,1,5,5])
    [1,2,3,4,1,5]

  """
  def eliminate_duplicates([]), do: []
  def eliminate_duplicates([head | tail]), do: eliminate_duplicates(head, tail, [head])
  defp eliminate_duplicates(key, [head | tail], final) do
    if head === key, do: eliminate_duplicates(key, tail, final), else: eliminate_duplicates(head, tail, final ++ [head])
  end
  defp eliminate_duplicates(_key, [], final), do: final

  @doc """
  P1.09: Pack consecutive duplicates of list elements into sublists.
  If a list contains repeated elements they should be placed in separate sublists.

  ## Examples

    iex> NinetyNineProblems.Lists.pack([1,1,1,2,2,2,2,1,1,3,3])
    [[1,1,1],[2,2,2,2],[1,1],[3,3]]

    iex> NinetyNineProblems.Lists.pack([1,2,1,3])
    [[1],[2],[1],[3]]

    iex> NinetyNineProblems.Lists.pack([])
    []

  """
  def pack([]), do: []
  def pack([head | tail]) do
    pack(tail, [[head]])
  end
  defp pack([head | tail], [[key | _tail] = f_head | f_tail] = final) do
    if (head === key) do
      pack(tail, [[head | f_head] | f_tail])
    else
      pack(tail, [[head] | final])
    end
  end
  defp pack([], final) do
    reverse_list(final)
  end

  @doc """
  P1.10: Run-length encoding of a list.
  Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as terms [N,E] where N is the number of duplicates of the element E.

  ## Examples

    iex> NinetyNineProblems.Lists.encode([1,1,1,2,2,2,2,1,1,3,3])
    [[3,1],[4,2],[2,1],[2,3]]

    iex> NinetyNineProblems.Lists.encode([1,2,1,3])
    [[1,1],[1,2],[1,1],[1,3]]

    iex> NinetyNineProblems.Lists.encode([])
    []

  """

  def encode([]), do: []
  def encode([_head | _tail] = list) do
    Enum.map(pack(list), fn([head | _tail] = x) -> [number_of_element(x), head] end)
  end

end
