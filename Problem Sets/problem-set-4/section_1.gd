extends Node

#1) Declare an array of strings with 5 names in it

var Names = ["Dobby", "Honey", "Donkey", "Baby", "Cookie"]

#2) Write a function that prints the names in order using a for loop and call it from _ready

func _ready():
	for shout in Names:
		print(shout)

#3) Write a function that takes in an array as an argument and swaps the fist value with the last one.
	#set temporary variable -> the first name is Dobby
	var temp = Names[0]
	#the fist name is the last name (Cookie)
	Names[0] = Names[Names.size()-1]
	#set the last name to be temporary variable
	Names[Names.size()-1] = temp
	#print both
	print(Names[0],Names[Names.size()-1])
	
	#try again with a= my first name, b= my last name's initial letter
	var a="Chattawan"
	var b="P."
	print(a,b) #test that it prints in order
	var temp2 = a #temp cannot be used twice -> temp2
	a = b
	b = temp2
	print(a,b) #recheck that it swaped, it worked yay!

	
	
	
