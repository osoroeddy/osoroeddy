defmodule Hangman do

defstruct game_state: "initializing", letters: [], used: [], turns_left: 7, last_guess: []

def new_game () do

   spell_word = Dictionary.random_word()

   game = %Hangman{}

   new_map = Map.put( game, :word_to_spell, spell_word)
   new_map
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
