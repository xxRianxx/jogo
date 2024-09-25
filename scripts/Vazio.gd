extends Area2D



func _on_Vazio_body_entered(body):
	if body.name == "personagem":
		GlobalVar.Almas = 0
		get_tree().reload_current_scene()
		
	
	pass # Replace with function body.
