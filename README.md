# Snek
Second Assignment for OOP.

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

#Game Modes

* Single Player
	
	In this mode the player's goal is to
	eat as much food as it can without 
	colliding with itself.
	
* VS AI

	In this mode the player's goal is to
	eat as much as possible while avoiding
	both itself and the Snake Bot. The Bot
	uses best first pathfinding to avoid obstacles
	and for the most part will avoid the player.

* AI debug

	This is where the Bot plays the game alone.
	The pathfinding debug is shown.
	
	Key: Turquoise - The Bot Snake
	
	Dark Green - Closed List
	
	Lighter Green - Open List
	
	Purple - Path


#Code Worth Viewing

* [The Bot's pathfinding.](https://github.com/equirke/Snek/blob/master/Bot.pde#L29)
	
	The type of pathfinding is best first, although what I
	was trying to write was Astar(Mine uses a different 
	heuristic).
	The bot will eventually die at around 65 food pieces eaten
	At around this point it will either surround itself
	or consume a food piece with no exit route out. 
	Otherwise the bot is quite adept at avoiding both itself
	and the player.

* [Code to avoid placing food on a occupied node](https://github.com/equirke/Snek/blob/master/Snek.pde#L398)

* [Use of try catch statement](https://github.com/equirke/Snek/blob/master/Snek.pde#L225)

	This catches an empty stack exception caused in the setDir method.
	When the exception is caught the bot's goal is changed to the top 
	left corner. If this point is also unreachable the bot will continue
	in the direction it was already going.

#Controls

	Make sure capslock is off.
* a - go left
* d - go right
* w - go up
* s - go down
