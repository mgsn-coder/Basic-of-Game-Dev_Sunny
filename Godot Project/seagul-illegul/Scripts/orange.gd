extends Area2D #area that detech entering collision

@export var speed = 100.0

# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	global_position.y += speed * delta


func _on_body_entered(body: Node2D) -> void:
	print("+1 orange yum!")
	queue_free() #remove food when touch
