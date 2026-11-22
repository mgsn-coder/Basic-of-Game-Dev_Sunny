extends Node

@onready var score_lebel : Label = $Score
@onready var pop_up: Label = $PopupPoint
@onready var player: CharacterBody2D = %Player
@onready var animation_player: AnimationPlayer = $PopupPoint/AnimationPlayer
@onready var hunger_label: Label = %Hunger
@onready var game_over_scene: Control = $"../UILayer/GameOverScene"


var score = 0

func update_hunger(value):
	hunger_label.text = "Hunger : " + str(value)

func add_point(points):
	score += points
	score_lebel.text = "score : " + str(score)
	if player.current_hunger < player.hungers[1]:
		player.current_hunger += points
		update_hunger(player.current_hunger)
	
func print(points):
	pop_up.text = "+ " + str(points)
	animation_player.play("popup")
	
func player_dead():
	game_over_scene.update_scores(score)
