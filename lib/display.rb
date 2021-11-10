# hangman/lib/display.rb
# frozen_string_literals: true

module Hangman
  class Display
    def initialize(secret: '', guesses: [], results: [])
      @secret = secret
      @guesses = guesses
      @results = results
    end

    def render(guesses:, results:)
      # Do stuff with these values. Remember they can empty!
    end

    private

    def show_hangman
    end

    def show_hits
    end
  end
end