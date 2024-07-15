extends Area2D

func _on_body_entered(body):
	get_tree().call_group("Player","set_player_on_ladder",true)

func _on_body_exited(body):
	get_tree().call_group("Player","set_player_on_ladder",false)
