tool
extends Spatial

var current_meshes_id: Array = []
var meshes_pos: Array = [Vector3(0, 6, 12), Vector3(0, 6, 11), Vector3(0, 6, 10), Vector3(0, 6, 9), Vector3(0, 6, 8), Vector3(0, 6, 7), Vector3(0, 6, 6), Vector3(0, 6, 5), Vector3(0, 6, 4), Vector3(0, 6, 3), Vector3(0, 6, 2), Vector3(0, 6, 1), Vector3(0, 6, 0), Vector3(0, 6, -1), Vector3(0, 6, -2), Vector3(0, 6, -3), Vector3(0, 6, -4), Vector3(0, 6, -5), Vector3(0, 6, -6), Vector3(0, 6, -7), Vector3(0, 6, -8), Vector3(0, 6, -9), Vector3(0, 6, -10), Vector3(0, 6, -11), Vector3(0, 6, -12), Vector3(0, 6, -13), Vector3(0, 6, -14), Vector3(0, 5, 12), Vector3(0, 5, 11), Vector3(0, 5, 10), Vector3(0, 5, 9), Vector3(0, 5, 8), Vector3(0, 5, 7), Vector3(0, 5, 6), Vector3(0, 5, 5), Vector3(0, 5, 4), Vector3(0, 5, 3), Vector3(0, 5, 2), Vector3(0, 5, 1), Vector3(0, 5, 0), Vector3(0, 5, -1), Vector3(0, 5, -2), Vector3(0, 5, -3), Vector3(0, 5, -4), Vector3(0, 5, -5), Vector3(0, 5, -6), Vector3(0, 5, -7), Vector3(0, 5, -8), Vector3(0, 5, -9), Vector3(0, 5, -10), Vector3(0, 5, -11), Vector3(0, 5, -12), Vector3(0, 5, -13), Vector3(0, 5, -14), Vector3(0, 4, 12), Vector3(0, 4, 11), Vector3(0, 4, 10), Vector3(0, 4, 9), Vector3(0, 4, 8), Vector3(0, 4, 7), Vector3(0, 4, 6), Vector3(0, 4, 5), Vector3(0, 4, 4), Vector3(0, 4, 3), Vector3(0, 4, 2), Vector3(0, 4, 1), Vector3(0, 4, 0), Vector3(0, 4, -1), Vector3(0, 4, -2), Vector3(0, 4, -3), Vector3(0, 4, -4), Vector3(0, 4, -5), Vector3(0, 4, -6), Vector3(0, 4, -7), Vector3(0, 4, -8), Vector3(0, 4, -9), Vector3(0, 4, -10), Vector3(0, 4, -11), Vector3(0, 4, -12), Vector3(0, 4, -13), Vector3(0, 4, -14), Vector3(0, 3, 12), Vector3(0, 3, 11), Vector3(0, 3, 10), Vector3(0, 3, 9), Vector3(0, 3, 8), Vector3(0, 3, 7), Vector3(0, 3, 6), Vector3(0, 3, 5), Vector3(0, 3, 4), Vector3(0, 3, 3), Vector3(0, 3, 2), Vector3(0, 3, 1), Vector3(0, 3, 0), Vector3(0, 3, -1), Vector3(0, 3, -2), Vector3(0, 3, -3), Vector3(0, 3, -4), Vector3(0, 3, -5), Vector3(0, 3, -6), Vector3(0, 3, -7), Vector3(0, 3, -8), Vector3(0, 3, -9), Vector3(0, 3, -10), Vector3(0, 3, -11), Vector3(0, 3, -12), Vector3(0, 3, -13), Vector3(0, 3, -14), Vector3(0, 2, 12), Vector3(0, 2, 11), Vector3(0, 2, 10), Vector3(0, 2, 9), Vector3(0, 2, 8), Vector3(0, 2, 7), Vector3(0, 2, 6), Vector3(0, 2, 5), Vector3(0, 2, 4), Vector3(0, 2, 3), Vector3(0, 2, 2), Vector3(0, 2, 1), Vector3(0, 2, 0), Vector3(0, 2, -1), Vector3(0, 2, -2), Vector3(0, 2, -3), Vector3(0, 2, -4), Vector3(0, 2, -5), Vector3(0, 2, -6), Vector3(0, 2, -7), Vector3(0, 2, -8), Vector3(0, 2, -9), Vector3(0, 2, -10), Vector3(0, 2, -11), Vector3(0, 2, -12), Vector3(0, 2, -13), Vector3(0, 2, -14), Vector3(0, 1, 12), Vector3(0, 1, 11), Vector3(0, 1, 10), Vector3(0, 1, 9), Vector3(0, 1, 8), Vector3(0, 1, 7), Vector3(0, 1, 6), Vector3(0, 1, 5), Vector3(0, 1, 4), Vector3(0, 1, 3), Vector3(0, 1, 2), Vector3(0, 1, 1), Vector3(0, 1, 0), Vector3(0, 1, -1), Vector3(0, 1, -2), Vector3(0, 1, -3), Vector3(0, 1, -4), Vector3(0, 1, -5), Vector3(0, 1, -6), Vector3(0, 1, -7), Vector3(0, 1, -8), Vector3(0, 1, -9), Vector3(0, 1, -10), Vector3(0, 1, -11), Vector3(0, 1, -12), Vector3(0, 1, -13), Vector3(0, 1, -14), Vector3(0, 0, 12), Vector3(0, 0, 11), Vector3(0, 0, 10), Vector3(0, 0, 9), Vector3(0, 0, 8), Vector3(0, 0, 7), Vector3(0, 0, 6), Vector3(0, 0, 5), Vector3(0, 0, 4), Vector3(0, 0, 3), Vector3(0, 0, 2), Vector3(0, 0, 1), Vector3(0, 0, 0), Vector3(0, 0, -1), Vector3(0, 0, -2), Vector3(0, 0, -3), Vector3(0, 0, -4), Vector3(0, 0, -5), Vector3(0, 0, -6), Vector3(0, 0, -7), Vector3(0, 0, -8), Vector3(0, 0, -9), Vector3(0, 0, -10), Vector3(0, 0, -11), Vector3(0, 0, -12), Vector3(0, 0, -13), Vector3(0, 0, -14), Vector3(0, -1, 12), Vector3(0, -1, 11), Vector3(0, -1, 10), Vector3(0, -1, 9), Vector3(0, -1, 8), Vector3(0, -1, 7), Vector3(0, -1, 6), Vector3(0, -1, 5), Vector3(0, -1, 4), Vector3(0, -1, 3), Vector3(0, -1, 2), Vector3(0, -1, 1), Vector3(0, -1, 0), Vector3(0, -1, -1), Vector3(0, -1, -2), Vector3(0, -1, -3), Vector3(0, -1, -4), Vector3(0, -1, -5), Vector3(0, -1, -6), Vector3(0, -1, -7), Vector3(0, -1, -8), Vector3(0, -1, -9), Vector3(0, -1, -10), Vector3(0, -1, -11), Vector3(0, -1, -12), Vector3(0, -1, -13), Vector3(0, -1, -14), Vector3(0, -2, 12), Vector3(0, -2, 11), Vector3(0, -2, 10), Vector3(0, -2, 9), Vector3(0, -2, 8), Vector3(0, -2, 7), Vector3(0, -2, 6), Vector3(0, -2, 5), Vector3(0, -2, 4), Vector3(0, -2, 3), Vector3(0, -2, 2), Vector3(0, -2, 1), Vector3(0, -2, 0), Vector3(0, -2, -1), Vector3(0, -2, -2), Vector3(0, -2, -3), Vector3(0, -2, -4), Vector3(0, -2, -5), Vector3(0, -2, -6), Vector3(0, -2, -7), Vector3(0, -2, -8), Vector3(0, -2, -9), Vector3(0, -2, -10), Vector3(0, -2, -11), Vector3(0, -2, -12), Vector3(0, -2, -13), Vector3(0, -2, -14), Vector3(0, -3, 12), Vector3(0, -3, 11), Vector3(0, -3, 10), Vector3(0, -3, 9), Vector3(0, -3, 8), Vector3(0, -3, 7), Vector3(0, -3, 6), Vector3(0, -3, 5), Vector3(0, -3, 4), Vector3(0, -3, 3), Vector3(0, -3, 2), Vector3(0, -3, 1), Vector3(0, -3, 0), Vector3(0, -3, -1), Vector3(0, -3, -2), Vector3(0, -3, -3), Vector3(0, -3, -4), Vector3(0, -3, -5), Vector3(0, -3, -6), Vector3(0, -3, -7), Vector3(0, -3, -8), Vector3(0, -3, -9), Vector3(0, -3, -10), Vector3(0, -3, -11), Vector3(0, -3, -12), Vector3(0, -3, -13), Vector3(0, -3, -14), Vector3(0, -4, 12), Vector3(0, -4, 11), Vector3(0, -4, 10), Vector3(0, -4, 9), Vector3(0, -4, 8), Vector3(0, -4, 7), Vector3(0, -4, 6), Vector3(0, -4, 5), Vector3(0, -4, 4), Vector3(0, -4, 3), Vector3(0, -4, 2), Vector3(0, -4, 1), Vector3(0, -4, 0), Vector3(0, -4, -1), Vector3(0, -4, -2), Vector3(0, -4, -3), Vector3(0, -4, -4), Vector3(0, -4, -5), Vector3(0, -4, -6), Vector3(0, -4, -7), Vector3(0, -4, -8), Vector3(0, -4, -9), Vector3(0, -4, -10), Vector3(0, -4, -11), Vector3(0, -4, -12), Vector3(0, -4, -13), Vector3(0, -4, -14), Vector3(0, -5, 12), Vector3(0, -5, 11), Vector3(0, -5, 10), Vector3(0, -5, 9), Vector3(0, -5, 8), Vector3(0, -5, 7), Vector3(0, -5, 6), Vector3(0, -5, 5), Vector3(0, -5, 4), Vector3(0, -5, 3), Vector3(0, -5, 2), Vector3(0, -5, 1), Vector3(0, -5, 0), Vector3(0, -5, -1), Vector3(0, -5, -2), Vector3(0, -5, -3), Vector3(0, -5, -4), Vector3(0, -5, -5), Vector3(0, -5, -6), Vector3(0, -5, -7), Vector3(0, -5, -8), Vector3(0, -5, -9), Vector3(0, -5, -10), Vector3(0, -5, -11), Vector3(0, -5, -12), Vector3(0, -5, -13), Vector3(0, -5, -14)]

#func _ready() -> void:
#
##	meshes = $Meshes.get_children()
#	for mesh in $Meshes.get_children():
#		meshes_pos.append(mesh.translation)
#		mesh.queue_free()
#	print(meshes)

#	# W
#	if not InputMap.has_action("W"):
#		InputMap.add_action("W")
#	var W: InputEventKey = InputEventKey.new()
#	W.scancode = KEY_W
#	InputMap.action_add_event("W", W)
#
#	# A
#	if not InputMap.has_action("A"):
#		InputMap.add_action("A")
#	var A: InputEventKey = InputEventKey.new()
#	A.scancode = KEY_A
#	InputMap.action_add_event("A", A)
#
#	# S
#	if not InputMap.has_action("S"):
#		InputMap.add_action("S")
#	var S: InputEventKey = InputEventKey.new()
#	S.scancode = KEY_S
#	InputMap.action_add_event("S", S)
#
#	# D
#	if not InputMap.has_action("D"):
#		InputMap.add_action("D")
#	var D: InputEventKey = InputEventKey.new()
#	D.scancode = KEY_D
#	InputMap.action_add_event("D", D)

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		$Meshes.rotation.y -= 0.01
	if Input.is_action_pressed("ui_left"):
		$Meshes.rotation.y += 0.01
	if Input.is_action_pressed("ui_up"):
		$Meshes.rotation.z -= 0.01
	if Input.is_action_pressed("ui_down"):
		$Meshes.rotation.z += 0.01

func add_mesh(id: int, color: Color, depth: int, Scene: PackedScene, orientation: int) -> void:
	if not current_meshes_id.has(id):
		var mesh: MeshInstance = Scene.instance()
		var material: SpatialMaterial = SpatialMaterial.new()
		mesh.translation = meshes_pos[id]

		material.albedo_color = color
		mesh.set_surface_material(0, material)

		$Meshes.add_child(mesh)
		mesh.rotation_degrees.x = -orientation
		mesh.depth_scene = Scene
		mesh.owner = $Meshes
		mesh.set_depth(depth-1)
		current_meshes_id.append(id)

	elif current_meshes_id.has(id):
		for mesh in $Meshes.get_children():
			if mesh.translation == meshes_pos[id]:
				var material: SpatialMaterial = SpatialMaterial.new()
				material.albedo_color = color
				mesh.set_surface_material(0, material)
				mesh.set_depth(depth-1)
				break

func remove_mesh(id: int) -> void:
	if current_meshes_id.has(id):
		for mesh in $Meshes.get_children():
			if mesh.translation == meshes_pos[id]:
				mesh.queue_free()
				current_meshes_id.erase(id)
				break

func get_ready_for_export() -> void:
	$Meshes.rotation = Vector3(0, 0, 0)

# JUST THE CODE TO AUTOMMATICALLY PLACE THE 144 MESHES

#func _ready() -> void:
#
#	$Meshes.owner = self
#	$Camera.owner = self
#
#	for i in 324:
#		var mesh: MeshInstance = load("res://addons/Pixel To 3D/Meshes/Box Mesh.tscn").instance()
#		$Meshes.add_child(mesh)
#
#	var count: int = 0
#	var z: int = 13.5
#	var y: int = 6
#
#	for mesh in $Meshes.get_children():
#		mesh.owner = self
#		if count == 27 or count == 54 or count == 81 or count == 108 or count == 135 or count == 162 or count == 189 or count == 216 or count == 243 or count == 270 or count == 297 or count == 324:
#			y -= 1
#			z = 13.5
#		z -= 1
#		mesh.translation.z = z
#		mesh.translation.y = y
#		count += 1
#	print(str(y))
#
#	var packed_scene: PackedScene = PackedScene.new()
#	packed_scene.pack(self)
#	ResourceSaver.save("res://3D.tscn", packed_scene)


