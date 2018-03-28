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

      iex> NinetyNineProblems.ListsContinued.decode_modified([[4,1],2,[2,3],[2,1],4,[4,5]])
      [1,1,1,1,2,3,3,1,1,4,5,5,5,5]

      iex> NinetyNineProblems.ListsContinued.decode_modified([1,2,3,1,4,5])
      [1,2,3,1,4,5]

      iex> NinetyNineProblems.ListsContinued.decode_modified([])
      []

  """
  def decode_modified([]), do: []
  def decode_modified([_head | _tail] = list) do
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


  @doc """
  P1.14: Duplicate the elements of a list.

  ## Examples

      iex> NinetyNineProblems.ListsContinued.duplicate([1,2,2,2,3,3,4,5])
      [1,1,2,2,2,2,2,2,3,3,3,3,4,4,5,5]

      iex> NinetyNineProblems.ListsContinued.duplicate([1,2,3,4,5])
      [1,1,2,2,3,3,4,4,5,5]

      iex> NinetyNineProblems.ListsContinued.duplicate([])
      []

  """
  def duplicate([]), do: []
  def duplicate([head | tail]), do: duplicate(tail, [head, head])
  defp duplicate([head | tail], final), do: duplicate(tail, [final | [head, head]])
  defp duplicate([], final), do: flatten_list(final)

  @doc """
  P1.15: Duplicate the elements of a list a given number of times.

  ## Examples

      iex> NinetyNineProblems.ListsContinued.repeat_duplicate([1,2,2,3,3,4,5], 3)
      [1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,4,4,4,5,5,5]

      iex> NinetyNineProblems.ListsContinued.repeat_duplicate([1,2,3,4,5], 3)
      [1,1,1,2,2,2,3,3,3,4,4,4,5,5,5]

      iex> NinetyNineProblems.ListsContinued.repeat_duplicate([], 1)
      []

  """
  def repeat_duplicate([], _repeat), do: []
  def repeat_duplicate([head | tail], repeat), do: repeat_duplicate(tail, repeat, decode([repeat, head]))
  defp repeat_duplicate([head | tail], repeat, final), do: repeat_duplicate(tail, repeat, (final ++ decode([repeat, head])))
  defp repeat_duplicate([], _repeat, final), do: final

  @doc """
  P1.16: Drop every N'th element from a list.

  ## Examples

      iex> NinetyNineProblems.ListsContinued.drop_nth([1,2,3,4,5,6,7,8,9], 3)
      [1,2,4,5,7,8]

      iex> NinetyNineProblems.ListsContinued.drop_nth([1,2,3,4,5], 2)
      [1,3,5]

      iex> NinetyNineProblems.ListsContinued.drop_nth([], 1)
      []

  """
  def drop_nth([], _n), do: []
  def drop_nth([head | tail], n), do: drop_nth(tail, n, [head], 2)
  defp drop_nth([head | tail], n, final, count) do
    if n === count, do: drop_nth(tail, n, final, 1), else: drop_nth(tail, n, [head | final], count + 1)
  end
  defp drop_nth([], _n, final, _count), do: reverse_list(final)
end