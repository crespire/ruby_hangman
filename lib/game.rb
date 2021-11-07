# hangman/lib/game.rb
#frozen_string_literal: true

module Hangman
  class Game
    attr_reader :secret, :guesses, :results, :rules
    def initialize(secret: '', guesses: [], results: [], rules: Rules.new())
      @secret = secret
      @guesses = guesses
      @results = results
      @rules = rules
    end

    def rules
      @rules ||= Rules.new()
    end

    def max_turns
      @rules.turns
    end

    def gameover
      @rules.gameover
    end
  end
end