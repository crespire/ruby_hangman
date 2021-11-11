# hangman/lib/player.rb
# frozen_string_literal: true

module Hangman
  class Player
    
    def initialize(name: '')
      @name = name
    end

    def prompt_name
      return @name unless @name.empty?

      valid = false
      until valid
        print "What's your name? "
        @name = gets.chomp
        valid = !@name.empty?
      end
      @name
    end

    def prompt_yesno
      valid = false
      until valid
        print '(y/n) '
        result = gets.chomp
        valid = %w[y n].include?(result)
      end
      result
    end

    def prompt_guess
      valid = false
      until valid
        print '(1 character) '
        result = gets.chomp.downcase
        valid = result.match(/[[:lower:]]/) && result.length == 1
      end
      result
    end
  end
end