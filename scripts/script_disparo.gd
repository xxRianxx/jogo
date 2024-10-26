
extends Area2D

var velocidade = 0.5
var direcao = 1   # 1 é direita, -1 é esquerda

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (direcao==1):
		$Sprite.flip_h = false
	elif (direcao==-1):
		$Sprite.flip_h = true     
	global_position.x += (velocidade * direcao)
