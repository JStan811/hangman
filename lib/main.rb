# frozen_string_literal: true

require_relative 'game_master'
require_relative 'computer'
require_relative 'player'

# script that will be used to run the game
dictionary_filename = '5desk.txt'

game_test = Hangman::GameMaster.new
computer_test = Hangman::Computer.new
player_test = Hangman::Player.new

game_test.load_dictionary(dictionary_filename)

dictionary = game_test.dictionary

computer_test.select_word(dictionary)
selected_word = computer_test.selected_word
puts selected_word

computer_test.create_word_board
word_board = computer_test.word_board
puts word_board

puts 'Enter your letter:'
player_test.guess_letter
guessed_letter = player_test.guessed_letter

computer_test.update_word_board(guessed_letter)
word_board = computer_test.word_board
puts word_board

puts "Correct guesses: #{computer_test.correct_guesses}"
puts "Incorrect guesses: #{computer_test.incorrect_guesses}"
