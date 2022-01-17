tool
extends Sprite

var depth: int = 1 setget set_depth

func set_depth(value: int) -> void:
	depth = value
	$Depth.text = str(depth)
