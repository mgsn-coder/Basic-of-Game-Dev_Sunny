extends Node

'''
Part 1)
In player.gd, declare the following variables/constants at the top of the script (outside any function):

health — an integer, starting at 100
max_health — an integer, also 100 (make this one a constant)
speed — an integer, starting at 50
player_name — a string, set to whatever you like

In _ready(), print all four values on one line using string concatenation, e.g. Chuckles The Clown | HP: 100/100 | Speed: 50.

String formatting and concatenation: 
	use commas for multiple arguments in print, or + to concatenate 
	eg: print("Hello ", "World") or print print("Hello " + "World") both print "Hello World" (you cannot use the '+' sign between a string and a number).
	Remember that print accepts variables as arguments
	eg:
		var score = 5
		print("Score is " , score) will print "Score is 5"
	Extra info: https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_format_string.html

Run it. Confirm the line prints correctly in the Output panel.

Part 2)
You now have health and max_health from Exercise 1. Instead of editing health directly, fill in this function:

func take_damage(amount):
    #subtract damage from health
    #print to the console how much damage the player took and how much health is remaining (use string concatenation)

In _ready(), call take_damage(15) twice in a row. Do not print health directly in _ready() — the function should report it.

Run it. Confirm HP drops by 15, then 15 again, and both messages print.

Part 3)
Using the same health and max_health from before, write a heal() function that will heal the player back to max_health (but no higher).
Use a while loop that adds 7 health to the player each loop.
Log the current health to the console for each step of the while loop.
In _ready(), after your two take_damage(15) calls from Part 2, call heal().

Part 4)
Variable fun time! Here are some exercises to make sure you understand variables. If you can't solve them, watch https://www.youtube.com/watch?v=ijjVDBPwA1o
4.1) What is the final value of a in this example?
var a = 5
a = a - 3
a = 5
a = a + a
		a = 10 # my answer

4.2) What is the final value of a in this example?
var a = 3
var b = 2
var c = a + b  # c= 5
var b = 0
var a = c - b  # a=5
var b = 10
		a = 5  # my answer

'''
# Called when the node enters the scene tree for the first time.

#part 1
var health : int = 100
var max_health : int = 100
var speed : int = 50
var player_name = "MEGASUNNIE"

func player_info():
	print(player_name, " | HP: ", health, "/100 ", "| SPEED: ", speed, "/50")
	
#part 2
'''
Erik showed me how to declare variables to assure it has default values.
It was a bit advanced for me right now, so I returned the code to way it is easy to follow.
For now.
'''
#func take_damage(times: int = 1,damage: int = 2):
func take_damage(bibi,damage):
	while bibi > 0:
		#print("HITS LEFT: ", bibi)
		bibi -= 1
		health -= damage
		print("TAKE DAMAGE: -", damage)
		
#part 3
func heal(amount):
	while health < max_health:
		health += amount
		if health > max_health:
			health = max_health
		print("HEAL: +", amount)
		player_info()
	print("HOORAY!")

func _ready() -> void:
	player_info()
	take_damage(2,15) #Erik taught me to do a bit futher about passing 2 variables.🙏
	player_info()
	heal(7)
