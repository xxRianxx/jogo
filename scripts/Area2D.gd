extends Area2D



func _on_Area2D_body_entered(body): 
	if body.name == "personagem":
		body.velocidade = 50
		body.forca_pulo = 50
		# Desabilita o diálogo, se estiver ativo
		if has_node("res://cenas/dialog.tscn"):
			var dialogo = get_node("res://cenas/dialog.tscn")
			dialogo.stop()  # Ou qualquer método que você tenha para parar o diálogo
		
		body.health = body.health - 30
		if body.health < 9:
			
			GlobalVar.Vassouras = 0
			get_tree().reload_current_scene()
	
			


func _on_Area2D_body_exited(body):
	if body.name == "personagem":
		body.velocidade = 300
		body.forca_pulo = 300
