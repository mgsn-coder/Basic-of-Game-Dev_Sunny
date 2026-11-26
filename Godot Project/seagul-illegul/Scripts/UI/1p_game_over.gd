extends Control

@onready var hi_score_label: Label = $"PanelContainer/Text Logo/score container/Results/hi_score num"
@onready var current_score_label: Label = $"PanelContainer/Text Logo/score container/Results/current_score num"


func _ready() -> void:
	var points = 0
	#hi-score
	points =GameMaster.high_scores[0]
	hi_score_label.text = str(points)
	
	#current score
	#Sunny note: pick the first element of an array -> 1p's score
	points = GameMaster.previous_points[0]
	current_score_label.text = str(points)
