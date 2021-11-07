=begin
  Hangman chances: head, body, larm, rarm, lleg, rleg

  Game: Load file handler
  Word: Randomly select 5-12 letter length word
  Game: Play the game
    Display: Present current man status to the player
    Display: Present current word status to play
    Player: Solicit input
    Word: Process input and update data

  Classes needed
    Display - handles generating hangman feedback (either text or picture) and handles generating representation of secret word.
    Player - get input, and keep track of guesses
    Word - handle matching and return feedback.
    Game - handle logic of game.
=end
