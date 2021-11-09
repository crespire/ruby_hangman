# hangman/lib/player.rb
# frozen_string_literal: true

module Hangman
  class Player
    
    def initialize(name: '')
      @name = name
    end

    def get_name
      return @name unless @name.empty?

      valid = false
      until valid
        print "What's your name? "
        @name = gets.chomp
        valid = !@name.empty?
      end
      @name
    end

  end
end