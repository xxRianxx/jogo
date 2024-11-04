extends Area2D


func _on_PassarDeFase4_body_entered(body):
	if body.name == "personagem" and GlobalVar.Vassouras == 7:
		get_tree().change_scene("res://cenas/fase4.tscn")
		GlobalVar.Vassouras = 0
