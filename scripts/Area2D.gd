extends Area2D



func _on_Area2D_body_entered(body): 
	if body.name == "personagem":
		# Desabilita o diálogo, se estiver ativo
		if has_node("res://cenas/dialog.tscn"):
			var dialogo = get_node("res://cenas/dialog.tscn")
			dialogo.stop()  # Ou qualquer método que você tenha para parar o diálogo

		GlobalVar.Vassouras = 0
		get_tree().reload_current_scene()


			

	
