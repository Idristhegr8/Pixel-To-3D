tool
extends Spatial

var current_meshes_id: Array = []
var meshes_pos: Array

func _ready() -> void:

#	meshes = $Meshes.get_children()
	for mesh in $Meshes.get_children():
		meshes_pos.append(mesh.translation)
		mesh.queue_free()
#	print(meshes)

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		$Meshes.rotation.y -= 0.01
	if Input.is_action_pressed("ui_left"):
		$Meshes.rotation.y += 0.01
	if Input.is_action_pressed("ui_up"):
		$Meshes.rotation.z -= 0.01
	if Input.is_action_pressed("ui_down"):
		$Meshes.rotation.z += 0.01

func add_mesh(id: int, color: Color, depth: int, Scene: PackedScene) -> void:
	if not current_meshes_id.has(id):
		var mesh: MeshInstance = Scene.instance()
		var material: SpatialMaterial = SpatialMaterial.new()
		mesh.translation = meshes_pos[id]

		material.albedo_color = color
		mesh.set_surface_material(0, material)

		$Meshes.add_child(mesh)
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


