# hangman/lib/rules.rb
#frozen_string_literal: true

module Hangman
  class Rules
    attr_reader :turns, :gameover
    
    def initialize(turns: 8)
      @turns = turns
      @gameover = false
    end
  end
end