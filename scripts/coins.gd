extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var coins_collected_sound: AudioStreamPlayer2D = $Coins_collected_sound
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

signal collected

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		collected.emit()
		#disable collision so coins will not collected twice
		collision_shape_2d.set_deferred("disabled", true)
		coins_collected_sound.play()
		visible = false
		await coins_collected_sound.finished
		queue_free()
