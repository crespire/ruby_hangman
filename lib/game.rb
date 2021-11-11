# hangman/lib/game.rb
# frozen_string_literal: true

module Hangman
  class Game
    require_relative 'secret'

    attr_reader :rules, :secret
    attr_accessor :guesses, :results

    def initialize(secret: Secret.new, guesses: [], results: [], rules: Rules.new, player: Player.new)
      @secret = secret
      @guesses = guesses
      @results = results
      @rules = rules
      @player = player
      @display = Display.new(@rules)
      @won = false
    end

    def max_turns
      @rules.turns
    end

    def gameover?
      @rules.check_gameover(secret: @secret, guesses: @guesses, results: @results)
    end

    def make_secret
      @secret.load_rules(@rules)
      @secret.grab_secret_word if @secret.empty?
      !@secret.empty?
    end

    def test_secret
      @secret.test_set_word
    end

    def play_round
      # Logic to play round
      @display.render(@secret, @guesses, @results)

      @guesses.push(@plaer.prompt_guess)
      @results = @secret.compare(guesses)
    end

    def welcome_msg
      puts "Welcome to hangman, where you have to guess the secret word before it's too late!"
      @player.prompt_name
      puts "Okay, #{@player.prompt_name}, let's hope you have what it takes to save the man!"
    end
  end
end
