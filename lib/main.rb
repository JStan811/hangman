# frozen_string_literal: true

require_relative 'game'
require_relative 'computer'
require_relative 'player'
require_relative 'save_manager'
require 'yaml'

# script that will be used to run the game

player = Hangman::Player.new
computer = Hangman::Computer.new
save_manager = Hangman::SaveManager.new
puts 'Would you like to open one of your saved games?'
player.make_load_selection
game = player.load_selection == 'y' ? save_manager.load_game : Hangman::Game.new(player, computer, save_manager)

game.play_game
