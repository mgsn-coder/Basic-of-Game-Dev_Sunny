extends CharacterBody2D

const SPEED := 800.0
func getYDir() -> float:
	return Input.get_action_strength("down") - Input.get_action_strength("up") 
#press -> 1, dont press -> 0
#down -> 1 - 0 -> Y move down, up -> 0 - 1 -> Y move up

func _physics_process(delta: float) -> void:
	var dir :Vector2=Vector2(0,getYDir())
	#move only Y axis
	velocity = dir * SPEED
	move_and_slide() #makes upper line work
	
