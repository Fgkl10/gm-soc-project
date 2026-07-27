extends CanvasLayer

signal loading_screen_ready

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var transition_animation_name := &"transition"

func _ready() -> void:
	await animation_player.animation_finished
	loading_screen_ready.emit()
	
func _on_progress_changed(new_value: float) -> void:
	print(new_value)
	
func _on_load_finished() -> void:
	
	animation_player.play_backwards(transition_animation_name)
	await animation_player.animation_finished
	queue_free()
