extends CharacterBody2D

@export var dialogue_id: String = "mercado1"

var player_near := false


func _input(event):
	if player_near and event.is_action_pressed("interact"):
		if DialogManager.current_dialogue.is_empty():
			DialogManager.start_dialogue(dialogue_id)
		else:
			DialogManager.next_dialogue()


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		player_near = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		player_near = false
