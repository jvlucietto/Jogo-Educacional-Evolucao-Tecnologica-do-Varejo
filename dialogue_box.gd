extends Control

@onready var dialogue_label = $Label

func _ready():
	DialogManager.set_dialogue_label(dialogue_label)
	visible = false
	DialogManager.set_dialogue_ui(self)
