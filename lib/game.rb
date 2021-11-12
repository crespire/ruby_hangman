# hangman/lib/game.rb
# frozen_string_literal: true

module Hangman
  class Game
    attr_reader :rules, :secret, :won, :guesses, :results

    def initialize(secret: Secret.new, rules: Rules.new, player: Player.new, guesses: '', results: '')
      @secret = secret
      @rules = rules
      @player = player
      @display = Display.new(@rules)
      @guesses = guesses
      @results = results
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

    def welcome_msg
      puts "Welcome to hangman, where you have to guess the secret word before it's too late!"
      @player.prompt_name
      puts "Okay, #{@player.prompt_name}, let's hope you have what it takes to save the man!"
    end

    def setup
      welcome_msg
      make_secret if @secret.empty?
    end

    def play_round
      # Logic to play round
      @display.render(secret: @secret, guesses: @guesses, results: @results)

      @guesses += @player.prompt_guess
      @results = @secret.compare(guesses)

      instance_variables.map do |var|
        print "#{var}: "
        p instance_variable_get(var)
      end

    end

    def after_round
      @won = @rules.player_win?(@secret, @guesses, @results)
      @display.render(secret: @secret, guesses: @guesses, results: @results) unless @won
      puts @won ? 'You got it! Way to go!' : "Better luck next time! The secret was '#{@secret}'."
    end
  end
end
