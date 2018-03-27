defmodule NinetyNineProblems.ListsContinued do
  import NinetyNineProblems.Lists
  @moduledoc """
  1. Lists [P1.11 ~ P1.20]
  """

  @doc """
  Lists part of 99 prolog problems.

  ## Examples

      iex> NinetyNineProblems.ListsContinued.questions
      :"ListsContinued [P1.11 ~ P1.20]"

  """
  def questions do
    :"ListsContinued [P1.11 ~ P1.20]"
  end

  @doc """
  P1.11: Modified run-length encoding.
  Modify the result of problem P10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as [N,E] terms.

  ## Examples

      iex> NinetyNineProblems.ListsContinued.encodeModified([1,1,1,1,2,3,3,1,1,4,5,5,5,5])
      [[4,1],2,[2,3],[2,1],4,[4,5]]

      iex> NinetyNineProblems.ListsContinued.encodeModified([1,2,3,1,4,5])
      [1,2,3,1,4,5]

      iex> NinetyNineProblems.ListsContinued.encodeModified([])
      []

  """
  def encodeModified([]), do: []
  def encodeModified([_head | _tail] = list) do
    Enum.map(pack(list), fn([head | _tail] = x) ->
      case number_of_element(x) do
        1 -> head
        elem -> [elem, head]
      end
    end)
  end

  @doc """
  P1.12: Decode a run-length encoded list.
  Given a run-length code list generated as specified in problem P11. Construct its uncompressed version.

  ## Examples

      iex> NinetyNineProblems.ListsContinued.decodeModified([[4,1],2,[2,3],[2,1],4,[4,5]])
      [1,1,1,1,2,3,3,1,1,4,5,5,5,5]

      iex> NinetyNineProblems.ListsContinued.decodeModified([1,2,3,1,4,5])
      [1,2,3,1,4,5]

      iex> NinetyNineProblems.ListsContinued.decodeModified([])
      []

  """
  def decodeModified([]), do: []
  def decodeModified([_head | _tail] = list) do
    flatten_list(Enum.map(list, fn(x) -> decode(x) end))
  end
  defp decode([head, tail | _rest]), do: decode([head - 1, tail], [tail])
  defp decode(x), do: x
  defp decode([head, tail | _rest], final) do
    case head do
      0 -> final
      _ -> decode([head - 1, tail], [tail | final])
    end
  end
end