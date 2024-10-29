extends Area2D



func _on_moeda_body_entered(body):
	if body.name == "personagem":
		GlobalVar.Vassouras += 1
		queue_free()
	
