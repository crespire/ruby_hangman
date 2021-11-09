require_relative 'game'
require_relative 'rules'
require_relative 'secret'

rules = Hangman::Rules.new(turns: 4, length: [8, 12])
game = Hangman::Game.new(rules: rules)
p game.max_turns
p game.gameover?
p game.make_secret
# secret = Hangman::Secret.new
# secret.make_secret_word
# secret
p game.rules

=begin

This file is where all the message calling goes. This is the structure we're shooting for.

exit = false
until exit
  Ask user if they want to load from file?
    If yes
      save = Save.new('filename')
      save.load_from_file
      game = Hangman::Game.new(Save.from_yaml)
    Otherwise
      game = Hangman::Game.new
      game.make_secret
  until game.gameover?
    game.play_round
  game.after_round (ie, you saved the man!)
  Play Again?
    if not, set exit to true

=end
