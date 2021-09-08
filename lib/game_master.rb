# frozen_string_literal: true

module Hangman
  # represents entity managing the game
  class GameMaster
    # potential attributes: computer object, player object
    def initialize(player, computer)
      @player = player
      @computer = computer
      @dictionary_filename = '5desk.txt'
    end

    def play_game
      puts 'Welcome to Hangman. You must guess the word to save a man from the rope! Good luck...'
      load_dictionary(@dictionary_filename)
      computer_initial_turn
      turn_loop
    end

    attr_reader :dictionary

    private

    # potential methods: play game, declare win/loss, new game?, loop rounds, keep score, load dictionary
    def load_dictionary(file)
      # read file in then clean out words that are less than 5 or more than 12 characters
      @dictionary = File.readlines(file).select { |word| word.length >= 5 && word.length <= 12 }
    end

    def computer_initial_turn
      @computer.select_word(dictionary)

      @computer.create_word_board
      word_board = @computer.word_board
      puts word_board
    end

    def player_turn_loop
      loop do
        puts 'Enter a letter:'
        @player.guess_letter
        if @computer.correct_guesses.include?(@player.guessed_letter) || @computer.incorrect_guesses.include?(@player.guessed_letter)
          puts 'Letter has already been guessed.'
          next
        elsif @player.guessed_letter.length != 1 || @player.guessed_letter =~ /\W/ || @player.guessed_letter =~ /\d/
          puts 'Please enter one letter.'
          next
        else
          break
        end
      end
    end

    def run_a_turn
      player_turn_loop

      @computer.update_word_board(@player.guessed_letter)
      word_board = @computer.word_board
      puts word_board

      puts "Correct guesses: #{@computer.correct_guesses}"
      puts "Incorrect guesses: #{@computer.incorrect_guesses}"
      puts "Remaining incorrect chances: #{@computer.incorrect_chances}"
      puts ''
    end

    def turn_loop
      loop do
        run_a_turn
        if @computer.incorrect_chances.zero?
          puts "You were unable to get the word in time and thus the man has been sent to the gallows."
          puts "Correct word: #{@computer.selected_word}"
          break
        elsif !(@computer.word_board.include? '_')
          puts "Well done! You saved a man's life today."
          break
        end
      end
    end
  end
end
