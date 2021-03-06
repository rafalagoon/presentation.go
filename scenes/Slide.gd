tool
class_name Slide extends Node2D



export (String) var title = "[Title]"


var is_playing = false


func _ready():
	if has_node("AnimationPlayer"):
		get_node("AnimationPlayer").current_animation = "Visible"


func _process(delta):
	$Title.text = title

	if is_visible_in_tree():
		if has_node("AnimationPlayer") and not is_playing:
			get_node("AnimationPlayer").play("Visible")
			is_playing = true
	else:
		if has_node("AnimationPlayer"):
			get_node("AnimationPlayer").seek(0)
			is_playing = false


