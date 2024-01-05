extends Node2D

@onready var ui = $Ui

var score_per_fish = 100 # TODO: add to json?
var fish_score = 0
var total_fish_count = 0

var current_map

func _ready():
	# TODO: menu to load map?
	current_map = load("res://scenes/maps/TestMap.tscn").instantiate()
	current_map.connect("on_fish_count_change", Callable(self, "on_fish_count_change"))
	current_map.connect("on_fish_complete", Callable(self, "on_fish_complete"))
	add_child(current_map)
	
	SoundManager.play_music(load("res://assets/audio/DST-TowerDefenseTheme.mp3"), 1, "BackgroundMusic")

func on_fish_count_change(fish_count):
	total_fish_count = fish_count
	ui.fish_count_update(total_fish_count)

func on_fish_complete(success, speed):
	if success:
		var score_item = score_per_fish + (speed / 2)
		fish_score += score_item
		ui.fish_score_update(fish_score)
