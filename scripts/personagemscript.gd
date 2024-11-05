extends KinematicBody2D

var velocidade = 300
var forca_pulo = 280
var gravidade = 1050
var mov = Vector2.ZERO
var pulando = false
var atirando = false
var direcao = 1

# Variáveis de HP e Mana
var vida := 100.0
var vida_maxima := 100.0
var restauracao_vida := 1.0
var mana := 100.0
var max_mana := 100.0
var restauracao_mana := 1.0

var max_pulos = 2  # Número máximo de pulos (1 no chão + 1 no ar)
var pulos_disponiveis = 2 

signal player_stats_changed

func _ready() -> void:
	emit_signal("player_stats_changed", self)
	
func _process(delta: float) -> void:
	var nova_mana = min(mana + restauracao_mana * delta, max_mana)
	if nova_mana != mana:
		mana = nova_mana
		emit_signal("player_stats_changed", self)
		
	var nova_vida = min(vida + restauracao_vida * delta, vida_maxima)
	if nova_vida != vida:
		vida = nova_vida
		emit_signal("player_stats_changed", self)

func _physics_process(delta):
	mov.x = 0  # Reseta o movimento horizontal a cada frame

	# Aplica gravidade apenas quando no ar
	if not is_on_floor():
		mov.y += gravidade * delta
		$AnimatedSprite.play("pulo")
		
	else:
		mov.y = 0  # Zera a velocidade vertical ao tocar o chão
	
	# Verifica se está no chão e reseta pulos disponíveis
	if is_on_floor():
		pulos_disponiveis = max_pulos
		pulando = false
	else:
		pulando = true
		
	# Pulo duplo
	if Input.is_action_just_pressed("ui_up") and pulos_disponiveis > 0:
		mov.y = -forca_pulo
		pulos_disponiveis -= 1  # Reduz o número de pulos disponíveis	
	
	# Movimento lateral (esquerda/direita)
	if not atirando:
		if Input.is_action_pressed("ui_left"):
			mov.x = -velocidade
			$AnimatedSprite.flip_h = true
			direcao = -1
			$AnimatedSprite.play("correr")
			
		elif Input.is_action_pressed("ui_right"):
			mov.x = velocidade
			$AnimatedSprite.flip_h = false
			direcao = 1
			$AnimatedSprite.play("correr")

	# Idle quando parado e não atirando
	if is_on_floor() and not atirando and mov.x == 0:
		$AnimatedSprite.play("parado")
	
	# Verifica o botão de disparo e permite disparar independentemente de estar no chão
	if Input.is_action_just_pressed("disparo") and not atirando:
		if mana > 10:
			mana -= 10
			emit_signal("player_stats_changed", self)
			$AnimationPlayer.play("atacando")
			atirando = true
	
	# Verifica se a animação de ataque terminou
	if not $AnimationPlayer.is_playing():
		atirando = false
		
	mov = move_and_slide(mov, Vector2(0, -1))

# Função para criar o disparo
func disparar(anim_name):
	if anim_name == "atacando":
		var cena_disparo = preload("res://cenas/cena_disparo.tscn")
		var obj_disparo = cena_disparo.instance()
		
		get_tree().root.add_child(obj_disparo)
		
		# Define a posição de disparo com base na direção do personagem
		if direcao == 1:
			obj_disparo.global_position = $Position2DDir.global_position
		elif direcao == -1:
			obj_disparo.global_position = $Position2DEsq.global_position
		
		obj_disparo.get_node("Area2D").direcao = direcao
