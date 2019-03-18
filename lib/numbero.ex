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
    # File.open('assets/dictionary.txt')
    File.stream!('assets/dictionary.txt')
    |> Stream.map(&String.trim/1)
    # |> Stream.into []
    |> Enum.to_list
    # |> List.to_tuple
    # |> Enum.map(&String.trim/1)
    # |> Enum.map(&String.to_charlist/1)
    {:ok, content} = File.read("assets/dictionary.txt")
    String.split(content, "\n", trim: true)
  end


  # def foo(input_number) when (length input_number == 10) do

  def foo do
    foo(6686787825 )
  end

  # 6686787825 should return the following list
  # [["motor", "usual"],
  #  ["noun", "struck"],
  #  ["nouns", "truck"],
  #  ["nouns", "usual"],
  #  ["onto", "struck"],
  #  "motortruck"]
  def foo(input_number) do
    words = ~w(motor truck star onto nouns struck baz motortruck foo bar)
    # words = all_words
    # number_cominations(input_number)

    all_words()
    # words
    # |> Stream.map(&word_to_no/1)
    # |> Enum.map(&number_cominations(&1,input_number))
    |> Stream.filter(&String.length(&1)>2)
    |> Enum.group_by(&number_cominations(&1,input_number))
    # iterate dictionary
    # take item
    # form its number
    # number is at front or end of input_number?
    # then add it to such key
    #
    # print the hash

  end

  def word_to_no word do

    word
    |> String.upcase
    |> String.codepoints
    |> Stream.map(&letter_to_number/1)
    |> Enum.to_list
    |> Integer.undigits
    |> to_string

    # possibly return {number, length}
    # next, regex for positions - begin_with, end_with, complete
    # add or skip... length  being the key
  end

  def letter_to_number letter do
    input_in_string = fn str -> String.contains? str, letter end

    cond do
      "ABC" |> String.contains?(letter) -> 2
      "DEF" |> String.contains?(letter) -> 3
      input_in_string.("GHI") -> 4
      input_in_string.("JKL") -> 5
      input_in_string.("MNO") -> 6
      input_in_string.("PQRS") -> 7
      input_in_string.("TUV") -> 8
      input_in_string.("WXYZ") -> 9
      true -> 0
    end

  end

  # begin or end
  def number_cominations abcword, input_number do
    # |> Stream.map(&word_to_no/1)


    word_no = abcword |> word_to_no
    numb = to_string input_number
    cond do
      String.starts_with?(numb, word_no) -> String.length(word_no)
      # String.ends_with?(numb, word_no) -> %{ String.length(word_no)*-1 => word_no }
      String.ends_with?(numb, word_no) ->  (String.length(word_no)* -1)
      true -> %{}
    end
    # %{
    #   straight: %{},
    #   reverse: %{}
    # }
  end

  # MapSet.intersection(MapSet.new(list1), MapSet.new(list2)) |> Enum.to_list
  def intersections list1, list2 do
    MapSet.intersection(MapSet.new(list1), MapSet.new(list2))
    |> Enum.to_list
  end

  # part experimental function. not needed
  def get_all_combinations_from input_number do
    map = %{
      2 => (List.to_tuple ~w(a b c)),
      3 => (List.to_tuple ~w(d e f)),
      4 => List.to_tuple ~w(g h i)
    }
    input_number
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
      2 => 'ABC',
      3 => 'DEF',
      4 => 'GHI',
      5 => 'JKL',
      6 => 'MNO',
      7 => 'PQRS',
      8 => 'TUV',
      9 => 'WXYZ'
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
    |> Enum.map(&to_string/1)
  end

  # for 3 numbers
  @doc """

  ## examples

  iex> Numbero.baz('abc', 'def', 'ghi')
  ['adg', 'adh', 'adi', 'aeg', 'aeh', 'aei', 'afg', 'afh', 'afi', 'bdg', 'bdh',
   'bdi', 'beg', 'beh', 'bei', 'bfg', 'bfh', 'bfi', 'cdg', 'cdh', 'cdi', 'ceg',
    'ceh', 'cei', 'cfg', 'cfh', 'cfi']

  """
  # all combinations
  # for a <- l1, b <-l1, String.length(a<>b)==10 ,do: %{ a<>b => [a, b] }

  # for a <- l1, b <-l1,
  #   String.length(a<>b)==7 && String.length(a) > 2 && String.length(b) > 2,
  #   do: %{ a<>b => [a, b] }

  # for a <- l1, b <-l1, String.length(a<>b)==10 ,do: a <> b
  def baz list do

    # list = all_words

    # for a <- word1, b <- word2, c <- word3, do: [a,b,c]
    # for a <- list, b <-list, String.length(a <> b)==10 ,do: a <> b
    # for a <- list, b <- list, into: [], do: [a, b]
    # for a <- list, b <- list, into: [], do: [a, b]

    # for a <- list do: a
    # for a <- list do
    #   for b <- list do
    #     if(length(a ++ b) == 10)
    #       do (a ++ b)
    #     end
    #   end
    # end


    # streame = File.stream!('assets/dictionary.txt')
    # |> Stream.map(&String.trim/1)


    # for a <- streame, b <- streame, length(a ++ b)==10, do: a ++ b

  end


end
