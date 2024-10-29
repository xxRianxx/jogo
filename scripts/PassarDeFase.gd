extends Area2D




func _on_Area2D_body_entered(body):
	if body.name == "personagem" and GlobalVar.Vassouras == 7:
		get_tree().change_scene("res://cenas/fase2.tscn")
		GlobalVar.Vassouras = 0
			
			
