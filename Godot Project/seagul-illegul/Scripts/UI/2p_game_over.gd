extends Control

@onready var winner: Label = $PanelContainer/winner
@onready var hs_score: Label = $"PanelContainer/winner/score container/Results/hs score"
@onready var winner_score: Label = $"PanelContainer/winner/score container/Results/winner score"
@onready var loser_score: Label = $"PanelContainer/winner/score container/Results/loser score"

func _ready() -> void:
	match GameMaster.previous_winner:
		1:
			print("player 2 win")
			winner_score.text = str(GameMaster.previous_points[1])
			winner.text = str("WINNER : P2")
			loser_score.text = str(GameMaster.previous_points[0])
		0:
			print("player 1 win")
			winner_score.text = str(GameMaster.previous_points[0])
			winner.text = str("WINNER : P1")
			loser_score.text = str(GameMaster.previous_points[1])
	hs_score.text = str(GameMaster.high_scores[1])
	if GameMaster.new_highscore:
		hs_score.text += str(" NEW HI-SCORE!")
