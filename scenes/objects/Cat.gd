extends Node2D

@onready var animated_sprite = $AnimatedSprite2D

var already_did_score_animation = 0
var manual_animation_playing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pick_random_animation()

func pick_random_animation():
	randomize()
	var animation_names = animated_sprite.sprite_frames.get_animation_names()
	var animation_index = randi() % len(animation_names)
	var animation_name = animation_names[animation_index - 1]
	animated_sprite.play(animation_name)

func _on_animated_sprite_2d_animation_looped():
	manual_animation_playing = false
	if animated_sprite.animation == "nod":
		pick_random_animation()

func fish_count_update(new_fish_count):
	if manual_animation_playing:
		return
	if new_fish_count >= 10:
		manual_animation_playing = true
		animated_sprite.play("jump")
	elif new_fish_count == 0:
		manual_animation_playing = true
		animated_sprite.play("idle")

func fish_score_update(new_score):
	if manual_animation_playing:
		return
	if new_score >= 2000 and (new_score - already_did_score_animation) >= 2000:
		manual_animation_playing = true
		animated_sprite.play("excited_2")
		already_did_score_animation = new_score

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if(event.is_action_pressed("ui_accept")):
		manual_animation_playing = true
		animated_sprite.play("loaf")
