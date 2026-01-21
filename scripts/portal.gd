extends Area2D
@onready var win_panel: Panel = $"../CanvasLayer/WinPanel"

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		#stop player
		body.set_physics_process(false)
		
		var tween = create_tween()
		tween.set_parallel(true)
		tween.tween_property(body, "global_position", global_position, 1.0)
		tween.tween_property(body, "scale", Vector2.ZERO, 1.0)
		
		#waiting to finish
		await tween.finished
		body.queue_free()
		win_panel.visible = true
