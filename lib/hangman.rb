require_relative 'game'
require_relative 'rules'
require_relative 'secret'
require_relative 'player'
require_relative 'display'

rules = Hangman::Rules.new(turns: 7, length: [8, 12])
player = Hangman::Player.new(name: "Test Robot")
game = Hangman::Game.new(rules: rules, player: player)
p game.max_turns
p game.gameover?
p game.test_secret
p game.secret
display = Hangman::Display.new(rules)
guesses = 'grasp'
p results = game.secret.compare(guesses)
p guesses.chars.difference(results.chars)
display.render(secret: game.secret, guesses: guesses, results: results)
# p game.rules
# game.play_round

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
  Display.render (initial render)
  until game.gameover?
    game.play_round
      Player.get_guess
      Add guess to guesses array
      save result of Secret.compare(guesses)
      Display.render
  game.after_round (ie, you saved the man!)
  Play Again?
    if not, set exit to true

=end
