extends Node2D
@onready var score_label: Label = $HUD/ScorePanel/ScoreLabel

var score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_setup_level()

func _setup_level() -> void:
	var coins_container = $Levels.get_node_or_null("coins")
	if coins_container:
		for enemy in coins_container.get_children():
				enemy.collected.connect(increase_score)
			
	var enemies = $Levels.get_node_or_null("Enemies")
	if enemies:
		for enemy in enemies.get_children():
			enemy.player_died.connect(_on_player_died)
			
#signal handle
func _on_player_died(body):
	body.die()
	print("Player died")
	
#score
func increase_score() -> void:
	score += 1
	score_label.text = "SCORE: %s" % score
