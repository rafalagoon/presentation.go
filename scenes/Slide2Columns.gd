tool
extends Slide



export (String) var subtitle1 = "[Subtitle]"
export (String) var subtitle2 = "[Subtitle]"



func _ready():
	pass


func _process(delta):
	$Column1/Title.text = subtitle1
	$Column2/Title.text = subtitle2


