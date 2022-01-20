tool
extends Sprite

var depth: int = 1 setget set_depth

func _ready() -> void:
	$Node/Depth.rect_global_position = global_position - Vector2(32, 24)
#	$Depth.set_as_toplevel(true)

func _notification(what: int) -> void:
	if what == NOTIFICATION_VISIBILITY_CHANGED:
		$Node/Depth.visible = visible

func set_depth(value: int) -> void:
	depth = value
	$Node/Depth.text = str(depth)
