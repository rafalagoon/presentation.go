extends Node2D



var current_slide = 1
var prev_slide = 0



func _ready():
	pass


func _process(delta):
	if Input.is_action_just_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	elif Input.is_action_just_pressed("ui_page_down"):
		next_slide()
	elif Input.is_action_just_pressed("ui_page_up"):
		prev_slide()



func change_slide ():
	if prev_slide > 0:
		get_node("Slides/Slide"+str(prev_slide)).visible = false
		
	get_node("Slides/Slide"+str(current_slide)).visible = true


func prev_slide ():
	if current_slide <= 1:
		return
			
	prev_slide = current_slide
	current_slide -= 1
	change_slide()


func home_slide ():
	if current_slide == 1:
		return

	prev_slide = current_slide
	current_slide = 1
	
	change_slide()


func next_slide ():
	if current_slide >= $Slides.get_child_count():
		return

	prev_slide = current_slide
	current_slide += 1
	change_slide()



func _on_Boundings_mouse_entered():
	$Controls.visible = true


func _on_Boundings_mouse_exited():
	$Controls.visible = false



func _on_PrevArea2D_input_event(viewport, event, shape_idx):
	if not event is InputEventMouseButton:
		return
		
	if event.is_pressed():
		prev_slide()


func _on_PrevArea2D_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_PrevArea2D_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)



func _on_HomeArea2D_input_event(viewport, event, shape_idx):
	if not event is InputEventMouseButton:
		return
		
	if event.is_pressed():
		home_slide()


func _on_HomeArea2D_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_HomeArea2D_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)



func _on_NextArea2D_input_event(viewport, event, shape_idx):
	if not event is InputEventMouseButton:
		return
		
	if event.is_pressed():
		next_slide()


func _on_NextArea2D_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_NextArea2D_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


