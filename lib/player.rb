# hangman/lib/player.rb
# frozen_string_literal: true

module Hangman
  class Player
    attr_reader :name

    def initialize(name: '')
      @name = name
    end

    def prompt_name
      valid = false
      until valid
        print "What's your name? "
        @name = gets.chomp
        valid = !@name.empty?
      end
      @name
    end

    def prompt_round_input
      valid = false
      until valid
        print "You can enter 'save' to save your game or input a guess: (1 character) "
        result = gets.chomp.downcase
        return result if result == 'save'

        valid = result.match(/[[:lower:]]/) && result.length == 1
      end
      result
    end

    def self.prompt_yesno
      valid = false
      until valid
        print ' (y/n) '
        result = gets.chomp
        valid = %w[y n].include?(result)
      end
      result
    end
  end
end