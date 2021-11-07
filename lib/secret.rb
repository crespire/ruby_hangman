# hangman/lib/secret.rb
# frozen_string_literal: true

module Hangman
  class Secret
    attr_reader :type, :secret

    def initialize(type: 'word')
      @type = type
      @secret = nil
    end

    def make_secret_word
      options = IO.readlines('5desk.txt', chomp: true)
      selection = options.sample

      until selection.length.between(5, 12) #hard code value for now, need to get this from options in the future
        selection = options.sample
      end

      selection
    end
  end
end