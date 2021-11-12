# hangman
Ruby assignment from The Odin Project.

The source code for this project is available on GitHub at https://github.com/crespire/hangman
An interactive version of this project is available on Replit at https://replit.com/@crespire/hangman

# TODO
* Clean up the display messaging in the Game class. For brevity, I wrapped it in a quick Display class method that takes a block.
* Consider utilizing custom rules in the future, like changing the length of the random word
* Consider adding the ability to enter a secret word, rather than pull one from the dict
* Consider allowing more than one save file
  *  This would require moving saves to their own dir.
  *  Then you could read the dir, output the files and ask the user to pick one.
  *  Would also have to update save logic so user could provide a name for each file.