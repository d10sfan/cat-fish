extends Node2D

var fish_count = 0
var timer
var spawning_fish = false

@onready var fish_trails_wrapper = $FishTrails
var fish = preload("res://scenes/objects/Fish.tscn")

signal on_fish_count_change(fish_count)
signal on_fish_complete(success, speed)

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	timer.one_shot = true
	timer.autostart = false
	add_child(timer)
	
	spawn_fish()
	
func _physics_process(_delta):
	if fish_count <= 0 and not spawning_fish:
		spawn_fish()

func spawn_fish():
	if spawning_fish:
		return
	
	spawning_fish = true
	randomize()
	var fish_trails = fish_trails_wrapper.get_children()
	var fish_trail_index = randi() % len(fish_trails)
	var fish_trail = fish_trails[fish_trail_index - 1]
	
	randomize()
	var spawn_fish_count = randi() % 20
	for num in spawn_fish_count:
		fish_count += 1
		var tmp_fish = fish.instantiate()
		tmp_fish.connect("on_fish_complete", Callable(self, "on_fish_complete_fish"))
		fish_trail.add_child(tmp_fish)
		emit_signal("on_fish_count_change", fish_count)
		timer.start(1); await timer.timeout
		
	spawning_fish = false

func on_fish_complete_fish(success, speed):
	fish_count = fish_count - 1
	if fish_count < 0:
		fish_count = 0
	emit_signal("on_fish_complete", success, speed)
	emit_signal("on_fish_count_change", fish_count)
