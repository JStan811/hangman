# frozen_string_literal: true

module Hangman
  # represents entity managing the game
  class GameMaster
    # potential attributes: computer object, player object

    attr_reader :dictionary

    # potential methods: play game, declare win/loss, new game?, loop rounds, keep score, load dictionary
    def load_dictionary(file)
      # read file in then trim out words that are less than 5 or more than 12 characters
      @dictionary = File.readlines(file).select { |word| word.length >= 5 && word.length <= 12 }
    end
  end
end
