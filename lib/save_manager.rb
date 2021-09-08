# frozen_string_literal: true

module Hangman
  # manages saving and loading of gamestate
  class SaveManager
    def initialize
      @game_saved = false
    end

    attr_reader :game_saved

    def save_game(game)
      @game_saved = true
      yaml = YAML.dump(game)
      File.open("save_files/saved_game.yaml", 'w') { |f| f.puts yaml }
    end

    def load_game
      yaml = File.open('save_files/saved_game.yaml', 'r') { |f| f.read }
      YAML.load(yaml)
    end
  end
end
