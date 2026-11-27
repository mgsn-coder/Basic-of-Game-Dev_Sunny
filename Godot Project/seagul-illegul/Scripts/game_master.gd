'''
ENI Note: this script is used for global variables and
communication between scenes loaded different times.
'''
extends Node

var previous_points: Array[int] = [0,0] #ENI Note: 1P, 2P 
var high_scores: Array[int] = [0,0] #ENI Note: 1P Mode, 2P Mode
var playing_2P_mode: bool = true;
var previous_winner: int = -1; #ENI Note: 0 = 1P, 1 = 2P

func update_highscore():
	#ENI Note: first, it checks the game mode and that the winner has been passed correctly
	if playing_2P_mode && previous_winner >= 0:
		#ENI Note: this should check the array of the winner and compare it with the current highscore
		if high_scores[1] < previous_points[previous_winner]:
			high_scores[1] = previous_points[previous_winner]
	else:
		if high_scores[0] < previous_points[0]:
			high_scores[0] = previous_points[0]

func inform_previous_points(points: Array[int] = [0,0], winner: int = -1):
	previous_points = points
	previous_winner = winner
	update_highscore()

func give_highscore(both: bool = false):
	if !both:
		if playing_2P_mode:
			return high_scores[1]
		return high_scores[0]
	return high_scores
