defmodule Numbero do
  @moduledoc """
  Documentation for Numbero.

  assignment:

  Given a 10 digit phone number, you must return all
  possible words or combination of words
  from the provided dictionary,
  that can be mapped back as a whole to the number.

  With this we can generate numbers
  like 1-800-motortruck which is easier to remember then 1-800-6686787825
  The phone number mapping to letters is as follows:

  2 = a b c
  3 = d e f
  4 = g h i
  5 = j k l
  6 = m n o
  7 = p q r s
  8 = t u v
  9 = w x y z

  The phone numbers will never contain a 0 or 1.
  Words have to be at least 3 characters.

  To get give you an initial verification, the following must be true:

  6686787825 should return the following list
  [["motor", "usual"],
  ["noun", "struck"],
  ["nouns", "truck"],
  ["nouns", "usual"],
  ["onto", "struck"],
  "motortruck"]

  2282668687 should return the following list
  [["act", "amounts"],
  ["act", "contour"],
  ["acta", "mounts"],
  ["bat", "amounts"],
  ["bat", "contour"],
  ["cat", "contour"],
  "catamounts"]

  The conversion of a 10 digit phone number should be performed within 1000ms.

  """

  @doc """
  Hello world.

  ## Examples

      iex> Numbero.hello()
      :world

  """
  def hello do
    :world
  end

  # number to all combinations
  # TODO number must not contain 1 & 0
  # return list of all combinations

  # 2 = a b c
  # 3 = d e f
  # 4 = g h i

  # find dictionary meanings
  def all_words do
    File.open('assets/dictionary.txt')
  end

  # all combinations
  # for a <- l1, b <-l1, String.length(a<>b)==10 ,do: %{ a<>b => [a, b] }
  # for a <- l1, b <-l1, String.length(a<>b)==10 ,do: a <> b
  def foo number do
    map = %{
      2 => (List.to_tuple ~w(a b c)),
      3 => (List.to_tuple ~w(d e f)),
      4 => List.to_tuple ~w(g h i)
    }
    number
    |> Integer.digits
    |> Enum.map(fn digit -> map[digit] end)
    # map[2]
  end

  # form words of characters
  # 10 - digits.
  def bar number do
    # a <- abc
    # b <- pqr
    # c <- xyz

    mape = %{
      2 => 'abc',
      3 => 'def',
      4 => 'ghi',
      5 => 'jkl',
      6 => 'mno',
      7 => 'pqrs',
      8 => 'tuv',
      9 => 'wxyz'
    }

    nos = Integer.digits(number)

    for n1 <- mape[ Enum.at(nos,0) ],
      n2 <- mape[ Enum.at(nos,1) ],
      n3 <- mape[ Enum.at(nos,2) ],
      n4 <- mape[ Enum.at(nos,3) ],
      n5 <- mape[ Enum.at(nos,4) ],
      n6 <- mape[ Enum.at(nos,5) ],
      n7 <- mape[ Enum.at(nos,6) ],
      n8 <- mape[ Enum.at(nos,7) ],
      n9 <- mape[ Enum.at(nos,8) ],
      n10 <- mape[ Enum.at(nos,9) ],

      do: [n1,n2,n3,n4,n5,n6,n7,n8,n9,n10]
  end

  # for 3 numbers
  @doc """

  ## examples

  iex> Numbero.baz('abc', 'def', 'ghi')
  ['adg', 'adh', 'adi', 'aeg', 'aeh', 'aei', 'afg', 'afh', 'afi', 'bdg', 'bdh',
   'bdi', 'beg', 'beh', 'bei', 'bfg', 'bfh', 'bfi', 'cdg', 'cdh', 'cdi', 'ceg',
    'ceh', 'cei', 'cfg', 'cfh', 'cfi']

  """
  def baz(word1, word2, word3) do
    for a <- word1, b <- word2, c <- word3, do: [a,b,c]
  end


end
