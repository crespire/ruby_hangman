# hangman/lib/game.rb
#frozen_string_literal: true

module Hangman
  class Game
    require_relative 'secret'

    attr_reader :guesses, :results, :rules
    def initialize(secret: nil, guesses: [], results: [], rules: Rules.new())
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

    def gameover?
      @rules.check_gameover(@guesses, @results)
    end

    def secret
      @secret ||= Secret.new
    end

    def make_secret
      @secret.make_secret_word
    end
  end
end