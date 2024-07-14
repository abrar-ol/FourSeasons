extends Area2D

signal player_on_ladder(is_player_on_ladder)


func _on_body_entered(body):
	print("emit body entered")
	player_on_ladder.emit(true)



func _on_body_exited(body):
	player_on_ladder.emit(false)
