tool
extends Control

func _on_Save_pressed() -> void:

	var file: File = File.new()

	if $"Tools/Saving Path".text != "":

		if file.file_exists("res://" + $"Tools/Saving Path".text + ".tscn"):
			get_parent().get_node("Save Overwrite").show()

		else:

			get_parent().get_node("ViewportContainer/Viewport/3D").get_ready_for_export()

			var packed_scene: PackedScene = PackedScene.new()
			packed_scene.pack(get_parent().get_node("ViewportContainer/Viewport/3D/Meshes"))
			ResourceSaver.save("res://" + $"Tools/Saving Path".text + ".tscn", packed_scene)

func _on_Ok_pressed() -> void:
	get_parent().get_node("ViewportContainer/Viewport/3D").get_ready_for_export()
	var packed_scene: PackedScene = PackedScene.new()
	packed_scene.pack(get_parent().get_node("ViewportContainer/Viewport/3D/Meshes"))
	ResourceSaver.save("res://" + $"Tools/Saving Path".text + ".tscn", packed_scene)
	get_parent().get_node("Save Overwrite").hide()

func _on_Color_pressed() -> void:
	$ColorPicker.show()
	get_tree().paused = true

func _on_Close_pressed() -> void:
	$ColorPicker.hide()
	get_tree().paused = false

func _on_Depth_text_changed(new_text: String) -> void:
	if new_text.is_valid_integer():
		if int(new_text) <= 5 and int(new_text) != 0:
			get_parent().depth = int(new_text)
		else:
			$Tools/Depth.text = str(get_parent().depth)

func _on_ColorPicker_color_changed(color: Color) -> void:
	$Tools/Color.modulate = color
	get_parent().get_node("Pixel").modulate = color
	get_parent().color = color

