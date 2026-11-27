'''
ENI Note: this script is used for global variables and
communication between scenes loaded different times.
'''
extends Node

var previous_points: Array[int] = [0,0] #ENI Note: 1P, 2P 
var high_scores: Array[int] = [0,0] #ENI Note: 1P Mode, 2P Mode
var playing_2P_mode: bool = true;
var previous_winner: int = -1; #ENI Note: 0 = 1P, 1 = 2P
var new_highscore: bool = false

func update_highscore():
	#ENI Note: first, it checks the game mode and that the winner has been passed correctly
	new_highscore = false
	if playing_2P_mode && previous_winner >= 0:
		#ENI Note: this should check the array of the winner and compare it with the current highscore
		if high_scores[1] < previous_points[previous_winner]:
			high_scores[1] = previous_points[previous_winner]
			new_highscore = true
	else:
		if high_scores[0] < previous_points[0]:
			high_scores[0] = previous_points[0]
			new_highscore = true

func inform_previous_points(points: Array[int] = [0,0], winner: int = -1):
	previous_points = points
	previous_winner = winner
	update_highscore()

'''
ENI Note: trying to make a new way to load a new scene.
I did not find any signal which would tell the global variable that
a new scene has been loaded.
I want it for more smoother music changing.

This was the closest I could find:
https://forum.godotengine.org/t/i-need-a-line-of-code-that-detects-when-the-scene-is-changed/12664/4
''' 
func load_new_scene(path: String = ""):
	get_tree().change_scene_to_file(path)
