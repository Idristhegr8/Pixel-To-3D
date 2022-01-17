#tool
extends Node2D

var pixels: Array
var pixels_positions: Array

var pressed: bool = false

var color: Color = Color("ffffff")
var depth: int = 1

enum {
	Pencil,
	Eraser
}

enum {
	Square,
	Triangle
}

var shape_pixels: Array = [
	load("res://addons/Pixel To 3D/Assets/Pixel.png"),
	load("res://addons/Pixel To 3D/Assets/Triangle.png")
	]

var shape_meshes: Array = [
	load("res://addons/Pixel To 3D/Meshes/Box Mesh.tscn"),
	load("res://addons/Pixel To 3D/Meshes/Triangle Mesh.tscn")
]

var state = Pencil
var shape = Square

func _ready() -> void:

	# Click
	if not InputMap.has_action("click"):
		InputMap.add_action("click")
	var click: InputEventMouseButton = InputEventMouseButton.new()
	click.button_index = BUTTON_LEFT
	InputMap.action_add_event("click", click)

	# E
	if not InputMap.has_action("Eraser"):
		InputMap.add_action("Eraser")
	var E: InputEventKey = InputEventKey.new()
	E.scancode = KEY_E
	InputMap.action_add_event("Eraser", E)

	# P
	if not InputMap.has_action("Pencil"):
		InputMap.add_action("Pencil")
	var P: InputEventKey = InputEventKey.new()
	P.scancode = KEY_P
	InputMap.action_add_event("Pencil", P)

#	state = Pencil
	for pixel in $Pixels.get_children():
		pixels.append(pixel)
		pixels_positions.append(pixel.global_position)
#	print(pixels_positions)

func _process(delta: float) -> void:

	var mouse_pos = get_global_mouse_position().snapped(Vector2(64, 64))
	mouse_pos = Vector2(mouse_pos.x+28, mouse_pos.y+40)

	$Pixel.global_position = (get_global_mouse_position().snapped(Vector2(64, 64))) + Vector2(-4, 8) + Vector2(32, 32)

	if Input.is_action_pressed("click"):
		if pixels_positions.has(mouse_pos):
			if state == Pencil:
				var pixel: Sprite = pixels[pixels_positions.find(mouse_pos)]
				pixel.texture = shape_pixels[shape]
				pixel.modulate = color
				pixel.show()
				pixel.depth = depth
				var pixel_id: int = pixels_positions.find(mouse_pos)
		#		var pixel_id: Vector2 = Vector2((pixel.global_position.x - 28)/64 - 12, (pixel.global_position.y - 40)/64 - 6)
#				$"ViewportContainer/Viewport/3D".meshes[pixel_id].show()
				$"ViewportContainer/Viewport/3D".add_mesh(pixel_id, color, depth, shape_meshes[shape])

			elif state == Eraser:
				var pixel: Sprite = pixels[pixels_positions.find(mouse_pos)]
				pixel.hide()
				var pixel_id: int = pixels_positions.find(mouse_pos)
		#		var pixel_id: Vector2 = Vector2((pixel.global_position.x - 28)/64 - 12, (pixel.global_position.y - 40)/64 - 6)
				$"ViewportContainer/Viewport/3D".remove_mesh(pixel_id)

	if Input.is_action_just_pressed("Pencil"):
		state = Pencil
	elif Input.is_action_just_pressed("Eraser"):
		state = Eraser

#func _on_Button_pressed() -> void:
#
#	var mouse_pos = get_global_mouse_position().snapped(Vector2(64, 64))
#	mouse_pos = Vector2(mouse_pos.x + 28, mouse_pos.y + 40)
#
#	if pixels_positions.has(mouse_pos):
#		if state == Pencil:
#			var pixel: Sprite = pixels[pixels_positions.find(mouse_pos)]
#			pixel.modulate = color
#			pixel.show()
#			pixel.depth = depth
#			var pixel_id: int = pixels_positions.find(mouse_pos)
#	#		var pixel_id: Vector2 = Vector2((pixel.global_position.x - 28)/64 - 12, (pixel.global_position.y - 40)/64 - 6)
##			$"ViewportContainer/Viewport/3D".meshes[pixel_id].show()
#			$"ViewportContainer/Viewport/3D".add_mesh(pixel_id, color, depth)
#
#		elif state == Eraser:
#			var pixel: Sprite = pixels[pixels_positions.find(mouse_pos)]
#			pixel.hide()
#			var pixel_id: int = pixels_positions.find(mouse_pos)
#	#		var pixel_id: Vector2 = Vector2((pixel.global_position.x - 28)/64 - 12, (pixel.global_position.y - 40)/64 - 6)
#			$"ViewportContainer/Viewport/3D".remove_mesh(pixel_id)

func _on_BG_mouse_entered() -> void:
	$Pixel.show()

func _on_BG_mouse_exited() -> void:
	$Pixel.hide()

func _on_Pencil_pressed() -> void:
	state = Pencil

func _on_Eraser_pressed() -> void:
	state = Eraser

func _on_Square_pressed() -> void:
	shape = Square
	$Pixel.texture = load("res://addons/Pixel To 3D/Assets/Pixel_outline.png")

func _on_Triangle_pressed() -> void:
	shape = Triangle
	$Pixel.texture = load("res://addons/Pixel To 3D/Assets/Triangle_outline.png")
















