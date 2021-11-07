# hangman/lib/game.rb
#frozen_string_literal: true

module Hangman
  class Game
    attr_reader :secret, :guesses, :results, :rules
    def initialize(secret: '', guesses: [], results: [], rules)
      @secret = secret
      @guesses = guesses
      @results = results
      @gameover = false
      @rules = rules
    end

    def max_turns
      @rules.turns
    end

    def rules
      @rules ||= Rules.new()
    end
  end
end