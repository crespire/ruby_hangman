# hangman/lib/secret.rb
# frozen_string_literal: true

module Hangman
  class Secret
    attr_reader :type, :secret

    def initialize(type: 'word')
      @type = type
      @secret = ''
      @rules = rules
    end

    def empty?
      return true if @secret.nil?

      @secret.empty?
    end

    def reset
      @secret = nil
    end

    def load_rules(rules)
      @rules = rules
    end

    def grab_secret_word
      return nil unless File.exist?('5desk.txt')
      return nil if @rules.nil?

      @secret = IO.readlines('5desk.txt', chomp: true).filter { |w| w.length.between?(@rules.min_length, @rules.max_length) }.sample.downcase
      true
    end

    def compare(guesses)
      #compare guess to secret
      # Returns the array of matched letters.
      results = ''
      @secret.each do |letter|
        next unless guess.include?(letter)
        results += guess
      end
      results
    end

    def input_secret_word
      # Option to get input for secret word. This is a TO_DO option.
    end

  end
end
