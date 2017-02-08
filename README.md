# Snek
Second Assignment for OOP.

[Video Demo](https://youtu.be/2k_naBJ-HSE)

#Summary of Workings
This game is a simple game of Snake.
The aim of the Snake is to consume as
much food as possible. If the snake eats 
itself the game is over.
It currently has wrapping borders. That is, if
the Snake reaches the edge of a screen it will reappear 
on the opposite edge.
I believe this is too easy, even with a smaller playing field
so I intend to remove it.

There is a VS mode where you can play against an AI Snake(You will lose).
There is a debug mode where you can simply view the AI in action, 
as well as being able to view its pathfinding.

#Game Modes/States

###Main Menu

In this mode the menu options are displayed
and a Bot plays Snake in the background at 
high speeds. Game Modes can be selected with
a mouse click on the relevant menu tile.

###Single Player
	
In this mode the player's goal is to
eat as much food as it can without 
colliding with itself.
	
###VS AI

In this mode the player's goal is to
eat as much as possible while avoiding
both itself and the Snake Bot. The Bot
uses best first pathfinding to avoid obstacles
and for the most part will avoid the player.

###AI debug

This is where the Bot plays the game alone.
The pathfinding debug is shown.
	
	Key: Turquoise - The Bot Snake
	
	Dark Green - Closed List
	
	Lighter Green - Open List
	
	Purple - Path
	
###Game Over

Displays the score of the player and/or bot
A button is there to click to return to 
the menu

#Code Worth Viewing

* [The Bot's pathfinding.](https://github.com/equirke/Snek/blob/master/Bot.pde#L29)
	
The type of pathfinding is [best-first-search](https://en.wikipedia.org/wiki/Best-first_search), although what I
was trying to write was [A*](https://en.wikipedia.org/wiki/A*_search_algorithm)(Mine uses a different 
heuristic).

	A* uses h(n) = f(n) + g(n)
	to select the next node to check
	in the open list
	
	n = Node
	f(n) = Distance from node to goal
	g(n) = Distance from node to starting point
	
	best-first just uses f(n)
	
The bot will eventually die at around 65 food pieces eaten
At around this point it will either surround itself
or consume a food piece with no exit route out. 
Otherwise the bot is quite adept at avoiding both itself
and the player.

* [Code to avoid placing food on a occupied node](https://github.com/equirke/Snek/blob/master/Snek.pde#L398)

* [Use of try catch statement](https://github.com/equirke/Snek/blob/master/Snek.pde#L225)

This catches an empty stack exception caused in the setDir method.
This exception is thrown when a route could not be made to the goal.
When the exception is caught the bot's goal is changed to the top 
left corner. If this point is also unreachable the bot will continue
in the direction it was already going.

* [Body class initialiser](https://github.com/equirke/Snek/blob/master/Body.pde#L12)

* [Body move method](https://github.com/equirke/Snek/blob/master/Body.pde#L28)

#Controls

	Make sure capslock is off.
* a - go left
* d - go right
* w - go up
* s - go down
