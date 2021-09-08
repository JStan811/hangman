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
      selected_word = @computer.selected_word
      puts selected_word

      @computer.create_word_board
      word_board = @computer.word_board
      puts word_board
    end

    def player_turn
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
      player_turn

      @computer.update_word_board(@player.guessed_letter)
      word_board = @computer.word_board
      puts word_board

      puts "Correct guesses: #{@computer.correct_guesses}"
      puts "Incorrect guesses: #{@computer.incorrect_guesses}"
      puts "Remaining incorrect chances: #{@computer.incorrect_chances}"
    end

    def turn_loop
      loop do
        run_a_turn
        if @computer.incorrect_chances.zero?
          puts "Unfortunately you've run out of guesses and the man has been hanged. Big rip"
          break
        elsif !(@computer.word_board.include? '_')
          puts "You've managed to guess the word and the man lives!"
          break
        end
      end
    end
  end
end
