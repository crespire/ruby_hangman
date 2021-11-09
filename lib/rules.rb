# hangman/lib/rules.rb
# frozen_string_literal: true

module Hangman
  class Rules
    attr_reader :turns, :length, :gameover

    def initialize(turns: 8, length: [5, 12])
      @turns = turns
      @length = length
      @gameover = false
    end

    def check_gameover(guesses, results)
      @turns == (guesses.length - results.length)
    end

    def min_length
      length[0]
    end

    def max_length
      length[1]
    end
  end
end