extends PathFollow2D

@onready var win_animation = $WinAnimation
@onready var sprite = $Sprite2D

# TODO: json?
var fish_colors = [
	"res://assets/objects/fishTile_072.png",
	"res://assets/objects/fishTile_074.png",
	"res://assets/objects/fishTile_076.png",
	"res://assets/objects/fishTile_078.png",
	"res://assets/objects/fishTile_080.png"
] 

var fish_speeds = [
	200,
	100,
	80,
	50,
	75
]

var speed = 80

signal on_fish_complete(success, speed)

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var fish_color_index = randi() % len(fish_colors)
	var fish_color = fish_colors[fish_color_index - 1]
	sprite.texture = load(fish_color)
	speed = fish_speeds[fish_color_index - 1]

func _physics_process(delta):
	move(delta)
	
func move(delta):
	set_progress(get_progress() + speed * delta)

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if(event.is_action_pressed("ui_accept")):
		remove_self(true)
		
func remove_self(success):
	sprite.visible = false
	emit_signal("on_fish_complete", success, speed)
	if success:
		win_animation.visible = true
		win_animation.play()
	else:
		delete_fish()

func delete_fish():
	queue_free()

func _on_animated_sprite_2d_animation_finished():
	win_animation.visible = false
	delete_fish()

func _on_visible_on_screen_notifier_2d_screen_exited():
	remove_self(false)
