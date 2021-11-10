# hangman/lib/display.rb
# frozen_string_literals: true

module Hangman
  class Display
    def initialize(rules:)
      @rules = rules
      @guesses = nil
      @results = nil
    end

    def render(guesses:, results:)
      # Do stuff with these values. Remember they can empty!
      @guesses = guesses
      @results = results

      show_hangman
      show_hits

      true
    end

    private

    def show_hangman
      body_index = 0
      body_parts = [
        'O'.center(5)
        '|'.center(5)
        '/|'.center(5)
        '/|\\'.center(5)
        '|'.center(5)
        '/'.center(5)
        '\\'.center(5)
      ]

      guesses.each do |guess|
        next if results.include?(guess)
        # Draw the next body part
        puts body_parts[body_index]
        body_index += 1
      end
    end

    def show_hits
    end
  end
end