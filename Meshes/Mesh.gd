tool
extends MeshInstance

var depth_scene: PackedScene
#var meshes: Array = []

func _ready() -> void:
	if "Triangle Mesh" in name:
		translation.z += 0.25

func set_depth(depth: int) -> void:

	for child in get_children():
		child.queue_free()

#	if meshes.size() != 0:
#		for b_mesh in meshes:
#			meshes.erase(b_mesh)
#			b_mesh.queue_free()

	var x: int = 0

	if depth != 0:
		for mesh in depth:
			x = x -2
			var mesh_1: MeshInstance = load("res://addons/Pixel To 3D/Meshes/Box Mesh.tscn").instance()
			mesh_1.scale = Vector3(1, 1, 1)
			mesh_1.translation = Vector3(0, 0, 0)
			mesh_1.translation.x = x
			mesh_1.set_surface_material(0, get_surface_material(0))
			add_child(mesh_1)
			mesh_1.owner = get_parent()
#			meshes.append(mesh_1)

		x = 0

		for mesh in depth:
			x = x +2
			var mesh_1: MeshInstance = load("res://addons/Pixel To 3D/Meshes/Box Mesh.tscn").instance()
			mesh_1.scale = Vector3(1, 1, 1)
			mesh_1.translation = Vector3(0, 0, 0)
			mesh_1.translation.x = x
			mesh_1.set_surface_material(0, get_surface_material(0))
			add_child(mesh_1)
			mesh_1.owner = get_parent()
#			meshes.append(mesh_1)

#func clear_depth_meshes() -> void:
##	if meshes.size() != 0:
##		for b_mesh in meshes:
##			meshes.erase(b_mesh)
##			b_mesh.queue_free()
#	queue_free()


