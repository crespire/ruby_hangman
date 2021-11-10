# hangman/lib/game.rb
# frozen_string_literal: true

module Hangman
  class Game
    require_relative 'secret'

    attr_reader :guesses, :results, :rules, :secret

    def initialize(secret: Secret.new, guesses: [], results: [], rules: Rules.new, player: Player.new)
      @secret = secret
      @guesses = guesses
      @results = results
      @rules = rules
      @player = player
    end

    def max_turns
      @rules.turns
    end

    def gameover?
      @rules.check_gameover(@guesses, @results)
    end

    def make_secret
      @secret.load_rules(@rules)
      @secret.grab_secret_word if @secret.empty?
      !@secret.empty?
    end

    def play_round
      # Logic to play round
      welcome_msg
      # Display.render(secret, guesses, results)
    end

    private

    def welcome_msg
      puts "Welcome to hangman, where you have to guess the secret word before it's too late!"
      @player.get_name
      puts "Okay, #{@player.get_name}, let's hope you have what it takes to save the man!"
    end
  end
end
