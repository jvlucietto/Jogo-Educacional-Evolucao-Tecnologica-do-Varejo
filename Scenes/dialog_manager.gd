extends Node

var dialogue_label: Label
var dialogue_ui: Control

var dialogues = {}
var current_dialogue = []
var current_index = 0

func set_dialogue_label(label):
	dialogue_label = label

func _ready():
	load_dialogues()


func set_dialogue_ui(ui):
	dialogue_ui = ui 
	dialogue_label = ui.get_node("Label")
	dialogue_ui.visible = false

func load_dialogues():
	var file = FileAccess.open("res://game_dialog.json", FileAccess.READ)
	
	if file:
		var content = file.get_as_text()
		dialogues = JSON.parse_string(content)
		

	else:
		print("ERRO: não consegui abrir o JSON")


func start_dialogue(dialogue_id):
	if dialogue_id not in dialogues:
		print("Diálogo não encontrado: ", dialogue_id)
		return
	
	current_dialogue = dialogues[dialogue_id]
	current_index = 0
	
	show_current_dialogue()


func show_current_dialogue():
	var dialogue = current_dialogue[current_index]
	dialogue_label.text = dialogue
	dialogue_ui.visible = true


func next_dialogue():
	current_index += 1
	
	if current_index >= current_dialogue.size():
		end_dialogue()
	else:
		show_current_dialogue()


func end_dialogue():
	current_dialogue = []
	current_index = 0
	dialogue_ui.visible = false
	
	
	print("Fim do diálogo")
