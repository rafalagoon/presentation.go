tool
extends Slide



export (String) var subtitle1 = "[Subtitle]"



func _ready():
	pass


func _process(delta):
	$Column1/Title.text = subtitle1


