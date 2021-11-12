require_relative 'game'
require_relative 'rules'
require_relative 'secret'
require_relative 'player'
require_relative 'display'
require_relative 'save'

# rules = Hangman::Rules.new(turns: 7, length: [8, 12])
# player = Hangman::Player.new(name: 'Test Robot')
# game = Hangman::Game.new(rules: rules, player: player)
# p game.max_turns
# p game.gameover?
# p game.test_secret
# p game.secret
# display = Hangman::Display.new(rules)
# game.guesses = 'groupxyz'
# p game.results = game.secret.compare(game.guesses)
# p game.guesses.chars.difference(game.results.chars)
# display.render(secret: game.secret, guesses: game.guesses, results: game.results)
# p game.gameover?
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
  until game.gameover?
    display = 
    game.welcome_msg
    game.play_round
  game.after_round (ie, you saved the man!)
  Play Again?
    if not, set exit to true

=end

stop_program = false
until stop_program
  puts "Welcome to hangman, where you have to guess the secret word before it's too late!"
  print 'Would you like to continue from your last saved game?'
  ans = Hangman::Player.prompt_yesno
  if ans == 'y'
    game = Hangman::Save.load_from_file('save')
  else
    game = Hangman::Game.new
  end
  game.setup
  game.play_round until game.gameover?
  game.after_round
  print 'Would you like to play again?'
  stop = Hangman::Player.prompt_yesno
  stop_program = stop == 'n'
end