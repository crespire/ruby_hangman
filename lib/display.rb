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
        " O   |\n/|\\  |\n",
        " O   |\n/|\\  |\n |   |",
        " O   |\n/|\\  |\n |   |\n/    |",
        " O   |\n/|\\  |\n |   |\n/ \\  |"
      ]

      misses = @guesses.chars.difference(@secret.to_s.chars)
      body_index = misses.length

      puts ' |---|'
      puts body_state[body_index]
      (5 - body_index).times { puts '     |' }
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
      print 'Guesses so far: '
      @guesses.chars.each { |c| print "#{c} " }
      print "\n"
    end
  end
end