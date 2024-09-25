extends Area2D




func _on_Area2D_body_entered(body):
	if body.name == "personagem":
		get_tree().change_scene("res://cenas/fase2.tscn")
			
			
