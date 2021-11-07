# hangman/lib/rules.rb
#frozen_string_literal: true

module Hangman
  class Rules
    attr_reader :turns, :length, :gameover

    def initialize(turns: 8, length: [5, 12])
      @turns = turns
      @length = length
      @gameover = false
    end

    def check_gameover(guesses, results)
      return @turns == (guesses.length - results.length)
    end
  end
end