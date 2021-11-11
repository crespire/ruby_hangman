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
        '     |', # 0
        ' O   |', # 1
        " O   |\n |   |", # 2
        " O   |\n/|   |", # 3
        " O   |\n/|\\  |\n", # 4
        " O   |\n/|\\  |\n |   |", # 5
        " O   |\n/|\\  |\n |   |\n/    |", # 6
        " O   |\n/|\\  |\n |   |\n/ \\  |" # 7
      ]

      misses = @guesses.chars.difference(@secret.to_s.chars)
      body_index = misses.length
      display_adjust = {
        0 => 0,
        1 => 0,
        2 => 1,
        3 => 1,
        4 => 1,
        5 => 2,
        6 => 3,
        7 => 3
      }

      puts "body_index: #{body_index}, putting #{4 - display_adjust[body_index]} blanks"

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
      print 'Guesses so far: '
      @guesses.chars.each { |c| print "#{c} " }
      print "\n"
    end
  end
end