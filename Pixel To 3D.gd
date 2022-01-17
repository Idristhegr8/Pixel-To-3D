tool
extends EditorPlugin

var main: Node2D = preload("res://addons/Pixel To 3D/Main/Main.tscn").instance()

func _enter_tree() -> void:
	get_editor_interface().get_editor_viewport().add_child(main)
	make_visible(false)


func _exit_tree() -> void:
	if main:
		main.queue_free()

func has_main_screen() -> bool:
	return true

func make_visible(visible: bool) -> void:
	if main:
		main.visible = visible

func get_plugin_name() -> String:
	return "Pixel To 3D"

func get_plugin_icon() -> Texture:
	return get_editor_interface().get_base_control().get_icon("Node", "EditorIcons")
