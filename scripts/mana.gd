extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_personagem_player_stats_changed(var player) -> void:
	$bar.rect_size.x = 78 * player.mana / player.max_mana
	pass # Replace with function body.