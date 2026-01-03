extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VolumeOff.visible = false
	$VolumeOff.disabled = true
	$Play.visible = false



func _on_play_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/lvl1.tscn")
	



func _on_instruction_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/instructions.tscn")



func _on_credit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credit.tscn")



func _on_volume_on_pressed() -> void:
	BgMusic.toggle_music()
	$VolumeOn.visible = false
	$VolumeOn.disabled = true
	$VolumeOff.visible = true
	$VolumeOff.disabled = false

func _on_volume_off_pressed() -> void:
	BgMusic.toggle_music()
	$VolumeOff.visible = false
	$VolumeOff.disabled = true
	$VolumeOn.visible = true
	$VolumeOn.disabled = false
