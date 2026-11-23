extends Control
@onready var points_1: Label = $P1/Points
@onready var hunger_bar_1: ProgressBar = $P1/Hunger/HungerBar
@onready var points_2: Label = $P2/Points
@onready var hunger_bar_2: ProgressBar = $P2/Hunger/HungerBar

var P1_text: String = "P1 points: "
var P2_text: String = "P2 points: "

func update_points(point_1: int = -1, point_2: int = -1):
	if point_1 < 0:
		return
	points_1.text = P1_text + str(point_1)
	if point_2 < 0:
		return
	points_2.text = P2_text + str(point_2)

#ENI note: recheck this https://gamedevacademy.org/progressbar-in-godot-complete-guide/

func update_hunger_bar(hunger_1: int = -1, hunger_2: int = -1):
	if hunger_1 < 0:
		return
	hunger_bar_1.value = hunger_1
	if hunger_2 < 0:
		return
	hunger_bar_2.value = hunger_2
