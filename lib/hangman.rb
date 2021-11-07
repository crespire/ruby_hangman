=begin
  See UML diagram for planning.
=end

require_relative 'game'
require_relative 'rules'

game = Hangman::Game.new
p game.max_turns
p game.gameover?