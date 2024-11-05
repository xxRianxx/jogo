extends KinematicBody2D

onready var timer_disparo = $Timer  # controlar quando vai atirar
onready var posicao_disparo = $Position2D
onready var anim_sprite = $AnimatedSprite 
var vida := 300.0
var vida_maxima := 300.0


func _ready():
	# Inicia o Timer para disparar a cada 2 segundos controla pela cena disparo
	timer_disparo.start()
	# Conecta o sinal de animação terminada ao próprio objeto

		
func _on_Timer_timeout():
	disparar()

func disparar():
	# Troca para a animação atirando
	anim_sprite.play("atirando")
	
	# Carrega a cena de atirando do boss
	var cena_disparo = preload("res://cenas/cena_disparo_inimigo.tscn")
	var obj_disparo = cena_disparo.instance()
	
	# Adiciona o veneno à cena principal
	get_tree().root.add_child(obj_disparo)
	
	
	obj_disparo.global_position = posicao_disparo.global_position
	
	# Define a direção do veneno para seguir o personagem
	var personagem = get_tree().get_root().find_node("personagem", true, false)
	if personagem:
		obj_disparo.direcao = (personagem.global_position - obj_disparo.global_position).normalized()

