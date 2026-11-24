extends Control
@onready var points_1: Label = $P1/Points
@onready var points_2: Label = $P2/Points

var P1_text: String = "P1 points: "
var P2_text: String = "P2 points: "

func update_points(point_array: Array[int] = [-1,-1]):
	if point_array[0] < 0:
		return
	points_1.text = P1_text + str(point_array[0])
	if point_array[1] < 0:
		return
	points_2.text = P2_text + str(point_array[1])
