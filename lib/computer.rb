# frozen_string_literal: true

module Hangman
  # The computer that will be picking the word to guess, managing the hangman, and providing feedback to the player
  class Computer
    # potential attributes: selected_word
    def initialize
      @correct_guesses = ''
      @incorrect_guesses = ''
      @incorrect_chances = 6
    end

    attr_reader :selected_word, :word_board, :correct_guesses, :incorrect_guesses, :incorrect_chances

    # potential methods: read dictionary, select word, give feedback, update hangman (update guesses remaining), update correct list, update incorrect list
    def select_word(dictionary)
      # randomly select word from dictionary array,downcase it so game is case insensitive, and remove last two characters: /r/n
      # potentially could keep case as is so proper nouns have first letter upper case, but then how did I support that while a player guesses?
      @selected_word = dictionary.sample.downcase[0...-2]
    end

    def create_word_board
      @word_board = '_ ' * (@selected_word.length)
    end

    def update_word_board(guessed_letter)
      if @selected_word.include? guessed_letter
        # split word into array, find index of every occurence of letter
        selected_word_array = @selected_word.split ''
        index_array = []
        selected_word_array.each_with_index do |c, i|
          index_array.push(i) if c == guessed_letter
        end
        # split word board into array, replace _s at each prvsly fnd index
        word_board_array = @word_board.split
        word_board_array.map!.with_index do |position, index|
          if index_array.include? index
            guessed_letter
          else
            position
          end
        end
        # join word board back into string and update @word_board
        @word_board = word_board_array.join ' '
        @correct_guesses += "#{guessed_letter} "
      else
        @incorrect_guesses += "#{guessed_letter} "
        @incorrect_chances -= 1
      end
    end
  end
end
