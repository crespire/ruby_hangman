# frozen_string_literal: true

require_relative 'game'
require_relative 'rules'
require_relative 'secret'
require_relative 'player'
require_relative 'display'
require_relative 'save'

stop_program = false
until stop_program
  puts "Welcome to hangman, where you have to guess the secret word before it's too late!"
  print 'Would you like to continue from your last saved game?'
  ans = Hangman::Player.prompt_yesno
  game = ans == 'y' ? Hangman::Save.load_from_file('save') : Hangman::Game.new
  game.setup
  game.play_round until game.gameover?
  game.after_round
  print 'Would you like to play again?'
  stop = Hangman::Player.prompt_yesno
  stop_program = stop == 'n'
end
