'''
ENI Note: this script is used for global variables and
communication between scenes loaded different times.
'''
extends Node

var previous_points: Array[int] = [0,0] #ENI Note: 1P, 2P 
var high_scores: Array[int] = [0,0] #ENI Note: 1P Mode, 2P Mode
var playing_2P_mode: bool = true; 

func update_highscore():
	if high_scores[1] < previous_points[1]:
		high_scores[1] = previous_points[1]
	if high_scores[0] < previous_points[0]:
		high_scores[0] = previous_points[0]

func inform_previous_points(points: Array[int] = [0,0]):
	previous_points = points
	update_highscore()

func give_highscore(both: bool = false):
	if !both:
		if playing_2P_mode:
			return high_scores[1]
		return high_scores[0]
	return high_scores
