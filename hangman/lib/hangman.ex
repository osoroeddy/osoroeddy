defmodule Hangman do

  defstruct game_state: "initializing", letters: [], used: [], turns_left: 7, last_guess: []


   def new_game() do

    spell_word = Dictionary.random_word()

    game = %Hangman{}

    state =  Map.put( game, :word_to_spell, spell_word)

   end

   def tally(game) do
   game = %Hangman{}
   game.game_state
   game.letters
   game.used
   game.turns_left
   game.last_guess

  end

  def make_move(game, guess) do

    game = %Hangman{}

    #word to be guesses

    word_to_guess =  Dictionary.random_word()

  contain_guess_letter = String.contains? word_to_guess, guess

   append = fn list, item ->
   list = Enum.reverse(list)
   list = [item|list]
   Enum.reverse(list)
   end

    if contain_guess_letter  and game.turns_left > 0 do

    letter_elem = append.(game.letters, guess)

    new_map = %{game |letters: letter_elem , game_state: "Good Guess", last_guess: guess}

    turns = game.turns_left - 1

    new_map = %{game | turns_left: turns}

    else

    new_map = %{game | game_state: "bad guess", letters: ["_"]}

    turns = game.turns_left - 1

    new_map = %{game | turns_left: turns}

    end

   turns = game.turns_left - 1

   new_map = %{game | turns_left: turns}


   game_letters = game.letters
   guess_word = String.graphemes word_to_guess

   letters_list =length game_letters
   guess_word_lenght = length guess_word

  list3 =  String.graphemes  word_to_guess

  if list3 === game_letters and letters_list === guess_word_lenght and game.turns_left == 0 do

  new_map = %{game | game_state: "won"}

  else

    new_map = %{game | game_state: "Lost"}

  end

   a_used = game.letters

  if Enum.member?(a_used, guess) do

   new_map = %{game | game_state: "Already_used", turns_left: turns}

  end
   end
  @moduledoc """
  Documentation for Hangman.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Hangman.hello
      :world

  """
  def hello do
    :world
  end
end
