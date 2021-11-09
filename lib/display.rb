# hangman/lib/display.rb
# frozen_string_literals: true

module Hangman
  class Display
    def initialize
    end

    def render(secret: secret, guesses: guesses, results: results)
      #Do stuff with these values. Remember they can empty!
    end

    private
    
    def show_hangman(secret: secret, guesses: guesses, results: results)
    end

    def show_hits(secret: secret, guesses: guesses, results: results)
    end
  end  
end