'''
ENI Note: this script is used for global variables and
communication between scenes loaded different times.
'''
extends Node

var high_scores: Array[int] = [0,0] #ENI Note: 1P Mode, 2P Mode
var playing_2P_mode: bool = false; 

func update_highscore(points: int = 0):
	if playing_2P_mode && high_scores[1] < points:
		high_scores[1] = points
	elif high_scores[0] < points:
		high_scores[0] = points

func give_highscore():
	if playing_2P_mode:
		return high_scores[1]
	return high_scores[0]
