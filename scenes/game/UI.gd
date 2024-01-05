extends CanvasLayer

@onready var score_value_label = $HUD/MarginContainer/ScoreContainer/HBoxContainer/ScoreValue
@onready var remaining_value_label = $HUD/MarginContainer/RemainingContainer/HBoxContainer/RemainingValue
@onready var cat = $HUD/MarginContainer/CatContainer/Cat

func _ready():
	fish_count_update(0)
	fish_score_update(0)

func fish_count_update(new_fish_count):
	remaining_value_label.text = str(new_fish_count)
	cat.fish_count_update(new_fish_count)

func fish_score_update(new_score):
	score_value_label.text = str(new_score)
	cat.fish_score_update(new_score)


func _on_help_button_pressed():
	pass # Replace with function body.
