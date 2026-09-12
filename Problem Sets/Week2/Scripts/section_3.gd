extends Node

# Write a for loop using range() that prints the numbers 1 through 10 (inclusive).

var number

func run():
	for number in range(10):
		print() # what is inclusive?

#rewrite it as a while loop

	while number > 10:
		print(number)
		number += 1

#Given an array scores = [10, 9, 7, 10, 6], write a for loop that calculates and prints the total sum.

func calculate_sum():
	var array = [10,9,7,10,6]
	var element
	
	for number in range(array):
		element = array[1+2+3+4+5] #culcurate the sum
		print(element) #print the sum
