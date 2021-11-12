# hangman/lib/display.rb
# frozen_string_literal: true

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
      show_guesses

      true
    end

    private

    def show_hangman
      body_state = [
        '     |',
        ' O   |',
        " O   |\n |   |",
        " O   |\n/|   |",
        " O   |\n/|\\  |",
        " O   |\n/|\\  |\n |   |",
        " O   |\n/|\\  |\n |   |\n/    |",
        " O   |\n/|\\  |\n |   |\n/ \\  |"
      ]

      misses = @secret.misses(@guesses)
      body_index = misses.length
      display_adjust = [0, 0, 1, 1, 1, 2, 3, 3]

      puts ' |---|'
      puts body_state[body_index]
      (4 - display_adjust[body_index]).times { puts '     |' }
      puts '-----|'
      true
    end

    def show_hits
      shown = ''
      @secret.to_s.each_char do |c|
        shown += @results.include?(c) ? c : '_'
        shown += ' '
      end
      puts shown
      true
    end

    def show_guesses
      return if @guesses.empty?

      print 'Guesses so far: '
      @guesses.chars.each { |c| print "#{c} " }
      print "\n"
    end
  end
end
