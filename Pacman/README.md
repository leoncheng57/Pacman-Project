NOTES
=====

TODO
----
* make the stage
* make ghosts
* make dots fill the board
* make Pacman move/not move in relation to blocks

Questions
---------
* how to read in a file like maze.dat into Processing?
* need to make vars private?
* readjust the devlog dates so that they look better?

Future Ideas
------------
* Fix Pacman's movement so that he will only changeDirection once he reaches the middle of the path (so that Pacman cannot move sideways inside one path)
* get images (background, pacman, ghosts, etc)
* different levels
* different stages
* different monsters
* two players
* differetn avatars for pacman, monsters
* different stage background color/design
* cheat/sandbox mode
* upgrades
* attack
* shooting, shield, gain lives, etc
* items (cherries, other fruits, etc)
* diff speeds for MrPacman
* point system


DEVLOG
------
* 5/29 - started block class for the stage
* 5/29 - started character class 
* 6/1 - made drawMe for MrPacman
* 6/1 - made move and keyPressed methods for MrPacman movement
* 6/2 - made drawMe for Block
* 6/2 - made checkCollision for Block (still working on Pacman movement in relation to blocks)
* 6/3 - made collision work
* 6/3 - put some blocks on the board
* 6/4 - make blocksGrid 2D array and placeBlocks method (now we can put the blocks in for the stage)
* 6/4 - reorganized methods in MrPacman and Organism so that more of the methods are in the superclass Organism
* 6/5 - began working on the Ghost and Node
* 6/7 - Pacman can now only move in the center of the path
* 6/7 - put nodes back into code