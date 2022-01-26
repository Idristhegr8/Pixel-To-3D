tool
extends Node2D

	# BG COLOR NORMAL: 141619

var pixels: Array
var pixels_positions: Array

var pressed: bool = false

var color: Color = Color("ffffff")
var depth: int = 1
var pixel_rotation: int = 0

enum {
	Pencil,
	Eraser,
	Color_Picker,
}

enum {
	Square,
	Triangle_1,
	Quater_Circle,
	Square_Cut_1,
	Square_Cut_2,
	Square_Cut_3,
	Square_Cut_4,
	Semi_Circle,
	Square_Cut_5,
	Square_Cut_6,
	Square_Cut_7,
	Triangle_2
}

var shape_pixels: Array = [
	load("res://addons/Pixel To 3D/Assets/Pixel.png"),
	load("res://addons/Pixel To 3D/Assets/Triangle_1.png"),
	load("res://addons/Pixel To 3D/Assets/Quater_circle.png"),
	load("res://addons/Pixel To 3D/Assets/Square_Cut_1.png"),
	load("res://addons/Pixel To 3D/Assets/Square_Cut_2.png"),
	load("res://addons/Pixel To 3D/Assets/Square_Cut_3.png"),
	load("res://addons/Pixel To 3D/Assets/Square_Cut_4.png"),
	load("res://addons/Pixel To 3D/Assets/Semi_Circle.png"),
	load("res://addons/Pixel To 3D/Assets/Square_Cut_5.png"),
	load("res://addons/Pixel To 3D/Assets/Square_Cut_6.png"),
	load("res://addons/Pixel To 3D/Assets/Square_Cut_7.png"),
	load("res://addons/Pixel To 3D/Assets/Triangle_2.png")
	]

var shape_meshes: Array = [
	load("res://addons/Pixel To 3D/Meshes/Box Mesh.tscn"),
	load("res://addons/Pixel To 3D/Meshes/Triangle 1 Mesh.tscn"),
	load("res://addons/Pixel To 3D/Meshes/Quater Circle Mesh.tscn"),
	load("res://addons/Pixel To 3D/Meshes/Square Cut 1 Mesh.tscn"),
	load("res://addons/Pixel To 3D/Meshes/Square Cut 2 Mesh.tscn"),
	load("res://addons/Pixel To 3D/Meshes/Square Cut 3 Mesh.tscn"),
	load("res://addons/Pixel To 3D/Meshes/Square Cut 4 Mesh.tscn"),
	load("res://addons/Pixel To 3D/Meshes/Semi Circle Mesh.tscn"),
	load("res://addons/Pixel To 3D/Meshes/Square Cut 5 Mesh.tscn"),
	load("res://addons/Pixel To 3D/Meshes/Square Cut 6 Mesh.tscn"),
	load("res://addons/Pixel To 3D/Meshes/Square Cut 7 Mesh.tscn"),
	load("res://addons/Pixel To 3D/Meshes/Triangle 2 Mesh.tscn"),
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
				pixel.rotation_degrees = pixel_rotation
				pixel.show()
				pixel.depth = depth
				var pixel_id: int = pixels_positions.find(mouse_pos)
		#		var pixel_id: Vector2 = Vector2((pixel.global_position.x - 28)/64 - 12, (pixel.global_position.y - 40)/64 - 6)
#				$"ViewportContainer/Viewport/3D".meshes[pixel_id].show()
				$"ViewportContainer/Viewport/3D".add_mesh(pixel_id, color, depth, shape_meshes[shape], $Pixel.rotation_degrees)

			elif state == Eraser:
				var pixel: Sprite = pixels[pixels_positions.find(mouse_pos)]
				pixel.hide()
				var pixel_id: int = pixels_positions.find(mouse_pos)
		#		var pixel_id: Vector2 = Vector2((pixel.global_position.x - 28)/64 - 12, (pixel.global_position.y - 40)/64 - 6)
				$"ViewportContainer/Viewport/3D".remove_mesh(pixel_id)

			elif state == Color_Picker:
				var pixel: Sprite = pixels[pixels_positions.find(mouse_pos)]
				color = pixel.modulate
				$UI/ColorPicker/ColorPicker.color = color
				$UI/Tools/Color.modulate = color

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

func _on_Color_Picker_pressed() -> void:
	state = Color_Picker

func _on_L_Turn_pressed() -> void:
	$Pixel.rotation_degrees += 90
	pixel_rotation = $Pixel.rotation_degrees

func _on_R_Turn_pressed() -> void:
	$Pixel.rotation_degrees -= 90
	pixel_rotation = $Pixel.rotation_degrees


func _on_Square_pressed() -> void:
	shape = Square
	$Pixel.texture = load("res://addons/Pixel To 3D/Assets/Pixel_outline.png")

func _on_Triangle1_pressed() -> void:
	shape = Triangle_1
	$Pixel.texture = load("res://addons/Pixel To 3D/Assets/Triangle_1_outline.png")

func _on_QuaterCircle_pressed() -> void:
	shape = Quater_Circle
	$Pixel.texture = load("res://addons/Pixel To 3D/Assets/Quater_circle_outline.png")

func _on_SquareCut1_pressed() -> void:
	shape = Square_Cut_1
	$Pixel.texture = load("res://addons/Pixel To 3D/Assets/Square_Cut_1_outline.png")

func _on_SquareCut2_pressed() -> void:
	shape = Square_Cut_2
	$Pixel.texture = load("res://addons/Pixel To 3D/Assets/Square_Cut_2_outline.png")

func _on_SquareCut3_pressed() -> void:
	shape = Square_Cut_3
	$Pixel.texture = load("res://addons/Pixel To 3D/Assets/Square_Cut_3_outline.png")

func _on_SquareCut4_pressed() -> void:
	shape = Square_Cut_4
	$Pixel.texture = load("res://addons/Pixel To 3D/Assets/Square_Cut_4_outline.png")

func _on_SemiCircle_pressed() -> void:
	shape = Semi_Circle
	$Pixel.texture = load("res://addons/Pixel To 3D/Assets/Semi_Circle_outline.png")

func _on_SquareCut5_pressed() -> void:
	shape = Square_Cut_5
	$Pixel.texture = load("res://addons/Pixel To 3D/Assets/Square_Cut_5_outline.png")

func _on_SquareCut6_pressed() -> void:
	shape = Square_Cut_6
	$Pixel.texture = load("res://addons/Pixel To 3D/Assets/Square_Cut_6_outline.png")

func _on_SquareCut7_pressed() -> void:
	shape = Square_Cut_7
	$Pixel.texture = load("res://addons/Pixel To 3D/Assets/Square_Cut_7_outline.png")

func _on_Triangle2_pressed() -> void:
	shape = Triangle_2
	$Pixel.texture = load("res://addons/Pixel To 3D/Assets/Triangle_2_outline.png")


func _on_Cancel_pressed() -> void:
	$"Save Overwrite".hide()


































