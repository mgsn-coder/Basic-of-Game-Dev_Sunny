extends AudioStreamPlayer2D

func change_music():
	var scene_name = get_tree().get_current_scene().get_name()
	'''
	ENI Note: 
	tutorial on Godot's match cases
	https://godottutorials.com/courses/introduction-to-gdscript/godot-tutorials-gdscript-09/
	'''
	match scene_name:
		"Level":
			Music.get_stream_playback().switch_to_clip(1)
		_:
			Music.get_stream_playback().switch_to_clip(0)
