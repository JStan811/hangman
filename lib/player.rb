# frozen_string_literal: true

module Hangman
  # represents human player "playing" the game
  class Player
    # potential attributes: name
    attr_reader :guessed_letter, :save_selection, :load_selection

    # potential methods: guess letter
    def guess_letter
      # collect user input and downcase to game is case insensitive
      @guessed_letter = gets.chomp.downcase
    end

    def make_save_selection
      @save_selection = gets.chomp
    end

    def make_load_selection
      @load_selection = gets.chomp
    end
  end
end
