extends AudioStreamPlayer

var is_muted := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func toggle_music():
	is_muted = !is_muted
	$".".volume_db = -80 if is_muted else -10
	
