# hangman/lib/rules.rb
#frozen_string_literal: true

module Hangman
  attr_reader :turns, :gameover
  class Rules
    def initialize(turns: 8)
      @turns = turns
      @gameover = false
    end
  end
end