# frozen_string_literal: true

module Hangman
  # represents human player "playing" the game
  class Player
    # potential attributes: name
    attr_reader :guessed_letter

    # potential methods: guess letter
    def guess_letter
      # collect user input and downcase to game is case insensitive
      @guessed_letter = gets.chomp.downcase
    end
  end
end
