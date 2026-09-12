extends Node

#Write a function greet() that prints "Hello, adventurer!" to the console.

func greet():
	print("Hello, adventure!")

#Write a function add_score(points) that takes one parameter and returns the current score plus points.
var score := 5

func add_score(points):
	score += points
	print(score)

#Write a function is_alive(hp) that takes an integer hp and returns true if hp is greater than 0, and false otherwise.
var hp := 80

func is_alive(hp):
	if hp > 0:
		true
	else: 
		false # I'm not sure about else

#Write a function heal(current_hp, amount, max_hp) that returns the new HP after healing, but never lets it exceed max_hp.
var max_hp := 100
var health

func heal(current_hp, amount, max_hp):
	current_hp = health + amount
	if current_hp > max_hp:
		print(max_hp)
	
	
#What keyword built into every Godot Node script runs once when the node enters the scene tree? Write a stub for it that prints a number of your choice.
# I don't know... T3T

#How often does the _process() function run?
# 60 frame/second, looping forever
