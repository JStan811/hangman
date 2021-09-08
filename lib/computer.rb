# frozen_string_literal: true

module Hangman
  # The computer that will be picking the word to guess, managing the hangman, and providing feedback to the player
  class Computer 
    # potential attributes: selected_word

    attr_reader :selected_word, :word_board

    # potential methods: read dictionary, select word, give feedback, update hangman (update guesses remaining), update correct list, update incorrect list
    def select_word(dictionary)
      @selected_word = dictionary.sample
    end

    def create_word_board
      # need to subtract 2 from word length b/c each word ends with "/r/n"
      @word_board = '_ ' * (@selected_word.length - 2)
    end
  end
end
