extends Area2D



func _on_dano_body_entered(body):
	if body.name == "personagem":
		body.health = body.health - 40
	
	if body.name == "personagem":
		if body.health < 9:
			GlobalVar.Vassouras = 0
			get_tree().reload_current_scene()
			
