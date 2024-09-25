extends Area2D



func _on_Area2D_body_entered(body):
	
	if body.name == "personagem":
		GlobalVar.Almas = 0
		get_tree().reload_current_scene()
		
	
