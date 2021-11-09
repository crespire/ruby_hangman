# hangman/lib/secret.rb
# frozen_string_literal: true

module Hangman

  class Secret
    attr_reader :type, :secret

    def initialize(type: 'word')
      @type = type
      @secret = nil
      @rules = nil
    end

    def empty?
      @secret.nil?
    end

    def reset
      @secret = nil
    end

    def load_rules(rules)
      @rules = rules
    end

    def rules
      @rules
    end

    def grab_secret_word
      return nil unless File.exist?('5desk.txt')

      @secret = IO.readlines('5desk.txt', chomp: true).filter { |w| w.length.between?(@rules.min_length, @rules.max_length) }.sample.downcase
    end

    def input_secret_word
      # Option to get input for secret word. This is a TO_DO option.
    end

  end
end
