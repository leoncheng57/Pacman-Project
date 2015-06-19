**PACMAN**
<br>*By Javis Wu and Leon Cheng*

Instructions
------------
Welcome to Pacman! Use the arrow keys to control MrPacman. Try to eat all of the food without getting killed by ghosts. But if you eat a powerup, you can kill the scared ghosts for more points!. Have fun!
* move with arrow keys
* win by eating all food
* lose lives if killed by ghost
* eat scared ghosts when you have powerup

NOTES
=====
To include in README
- name of the proejct
- who worked on it
- instructions to run
- anything else I should know.

TODO
----
* ai movement
* a way to die
* a way to win
* multiple levels? increasing difficulty?
* deal with comments inside code
* Make sure to contact Z when we're finished and thank him for the extension 

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
* differetn avatars for pacman, monsters
* different stage background color/design
* cheat/sandbox mode
* upgrades
* attack
* shooting, shield, gain lives, etc
* items (cherries, other fruits, etc)
* diff speeds for MrPacman


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
* 6/8 - made better, still working on ghost movement
* 6/9 - organized some stuff
* 6/10 - completed updatePac
* 6/11 - still working on solve
* 6/12 - made some progress on solve
