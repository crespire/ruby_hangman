# hangman/lib/rules.rb
# frozen_string_literal: true

module Hangman
  class Rules
    attr_reader :turns, :length, :won

    def initialize(turns: 7, length: [5, 12])
      @turns = turns
      @length = length
      @won = false
    end

    def check_gameover(secret:, guesses:, results:)
      return true if player_win?(secret, guesses, results)
      return true if hangman?(guesses, results)

      false
    end

    def min_length
      length[0]
    end

    def max_length
      length[1]
    end

    def player_win?(secret, guesses, results)
      misses = secret.misses(guesses)
      @won = misses.length < @turns && secret.to_s.chars.all? { |c| results.include?(c) }
    end

    def hangman?(guesses, results)
      @turns == (guesses.length - results.length)
    end
  end
end