extends Area2D

var velocidade = 5
var direcao = 1  
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (direcao==1):
		$Sprite.flip_h = false
	elif (direcao==-1):
		$Sprite.flip_h = true     
	global_position.x += (velocidade * direcao)


func _on_Area2D_body_entered(body):
	if body.name == "inimigoAranha": 
		body.queue_free() 
		
	if body.name == "inimigoAranha3": 
		body.queue_free()
		
	if body.name == "inimigoAranha2": 
		body.queue_free()
		
	
	if body.name == "inimigoAranha4": 
		body.queue_free()
		

  # Retorna o tiro para sua posição inicial

		
