# hangman/lib/game.rb
#frozen_string_literal: true

module Hangman
  class Game
    def initialize(secret: '', guesses: [], results: [])
      @secret = secret
      @guesses = guesses
      @results = results
      @gameover = false
    end
  end
end