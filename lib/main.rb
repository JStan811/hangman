# frozen_string_literal: true

require_relative 'game_master'
require_relative 'computer'
require_relative 'player'

# script that will be used to run the game

player_test = Hangman::Player.new
computer_test = Hangman::Computer.new
game_test = Hangman::GameMaster.new(player_test, computer_test)

game_test.play_game
