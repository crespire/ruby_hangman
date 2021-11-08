# hangman/lib/secret.rb
# frozen_string_literal: true

module Hangman
  class Secret
    attr_reader :type, :secret

    def initialize(type: 'word')
      @type = type
      @secret = nil
    end

    def grab_secret_word
      @secret = IO.readlines('5desk.txt', chomp: true).filter { |w| w.length.between?(5, 12) }.sample.downcase
    end

    def input_secret_word
    end
  end
end
