extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()


func _on_information_area_body_entered(body):
	print("player entered")
