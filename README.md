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

There is a VS mode where you can play against an AI Snake(You will lose).
There is a debug mode where you can simply view the AI in action, 
as well as being able to view its pathfinding.

#Code Worth Viewing

* [The Bot's pathfinding.](https://github.com/equirke/Snek/blob/master/Bot.pde#L22)
	The bot will eventually die at around 65 food pieces eaten
	At around this point it will either surround itself
	or consume a food piece with no exit route.

* [Code to avoid placing food on a occupied node](https://github.com/equirke/Snek/blob/master/Snek.pde#L297)

#Controls

	Make sure capslock is off.
* a - go left
* d - go right
* w - go up
* s - go down
