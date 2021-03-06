# Pacman-Project
<br>*By Javis Wu and Leon Cheng*

Instructions
------------
<h6>Regular Instructions</h6>

&nbsp;&nbsp;&nbsp;&nbsp;Welcome to Pacman! Use the arrow keys to control MrPacman. Try to eat all of the food to win! If you eat a powerup, you can kill the scared ghosts for more points!. Play with different stages! Have fun!

<h6>Simple Instructions</h6>
* move with arrow keys
* gain points by eating food
* win by eating all food
* lose if killed by ghost
* eat scared ghosts when you have powerup
* use number keys (1,2,3,4,5) to change the stage after you die/win

<h6>Cheat</h6>
* press z to start force ghosts into scared mode

NOTES FOR Z
=====
We had trouble with trying to use a recursive solve for the ghost ai movement. Did not work out in the end and took up a lot of time. Then we tried BFS but that also had errors. We left the code in if you want to take a look at it. In the end, we resorted to random movement.

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
* 6/13 - wrote updateReddy, imrpoved stage copy, made progress on ghost movement
* 6/14 - improved printing data, started to use bfs because stuck with solve
* 6/16 - gave up on solve and bfs, couldn't get, now using random movement
* 6/17 - added 4 ghosts, worked on superpower, scared, and ghost dying
* 6/18 - added endGame and mouseclicked
* 6/19 - got ghosts to kill pac, got pac to kill ghosts, ghosts able to respawn, able to restart game, game endscreen made, added multiple stages
