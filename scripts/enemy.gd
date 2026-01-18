extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer

const SPEED = 100.0
var direction = 1.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite_2d.play("running")
	timer.wait_time = 2.0
	timer.one_shot = false
	if not timer.timeout.is_connected(_on_timer_timeout):
		timer.timeout.connect(_on_timer_timeout)
		timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.x += direction * SPEED * delta
	
func _on_timer_timeout() -> void:
	direction *= -1
	animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
	print(direction)
	
