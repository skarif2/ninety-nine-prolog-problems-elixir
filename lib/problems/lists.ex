defmodule NinetyNineProblems.Lists do
  @moduledoc """
  1. Lists [P1.01 ~ P1.28]
  """

  @doc """
  Lists part of 99 prolog problems.

  ## Examples

      iex> NinetyNineProblems.Lists.questions
      :"Lists [P1.01 ~ P1.28]"

  """
  def questions do
    :"Lists [P1.01 ~ P1.28]"
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
  def reverse_list([head | tail], revarsed), do: reverse_list(tail, [head] ++ revarsed)
  def reverse_list([], revarsed), do: revarsed
  def reverse_list(_, _), do: :error

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
end
