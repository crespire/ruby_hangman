# hangman/lib/display.rb
# frozen_string_literals: true

module Hangman
  class Display
    def initialize(rules)
      @rules = rules
      @guesses = nil
      @results = nil
    end

    def render(secret:, guesses:, results:)
      # Do stuff with these values. Remember they can empty!
      @guesses = guesses
      @results = results
      @secret = secret

      show_hangman
      show_hits

      true
    end

    private

    def show_hangman
      body_state = [
        ' O   |',
        " O   |\n |   |",
        " O   |\n/|   |",
        " O   |\n/|\\  |\n",
        " O   |\n/|\\  |\n |   |",
        " O   |\n/|\\  |\n |   |\n/    |",
        " O   |\n/|\\  |\n |   |\n/ \\  |"
      ]

      misses = @guesses.chars.difference(@results.chars)
      body_index = misses.length - 1

      puts " |---|"
      puts body_state[body_index]
      (4 - body_index).times { puts '     |' }
      puts "-----|"

      true
    end

    def show_hits
      shown = ''
      @secret.to_s.each_char do |c|
        if @results.include?(c)
          shown += c
        else
          shown += '_'
        end
        shown += ' '
      end
      puts shown

      true
    end
  end
end