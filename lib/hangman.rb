=begin
  See UML diagram for planning.
=end

require_relative 'game'
require_relative 'rules'

game = Hangman::Game.new
p game.max_turns
p game.gameover?

=begin

This file is where all the message calling goes. This is the structure we're shooting for.

exit = false
until exit
  game = Hangman::Game.new
  Ask user if they want to load from file?
    If yes
      game.load_from_file
    Otherwise
      game.make_secret
  until game.gameover?
    game.play_round
  game.after_round (ie, you saved the man!)
  Play Again?
    if not, set exit to true

=end