extends KinematicBody2D

var velocidade = 300
var forca_pulo = 300
var gravidade = 1000
var mov = Vector2.ZERO
var pulando = false
var atirando = false
var direcao = 1

#variavel HP
var health := 100.0
var max_health := 100.0
var health_recovery := 1.0
#variavel Mana
var mana := 100.0
var max_mana := 100.0
var mana_recovery := 1.0


signal player_stats_changed

func _ready() -> void:
	emit_signal("player_stats_changed", self)
	
func _process(delta: float) -> void:
	var new_mana = min(mana + mana_recovery * delta, max_mana)
	if new_mana != mana:
		mana = new_mana
		emit_signal("player_stats_changed", self)
		
	var new_health = min(health + health_recovery * delta, max_health)
	if new_health != health:
		health = new_health
		emit_signal("player_stats_changed", self)
func _physics_process(delta):
	mov.x = 0  # Reseta o movimento horizontal a cada frame

	# Aplica gravidade apenas quando no ar
	if not is_on_floor():
		mov.y += gravidade * delta
		$AnimatedSprite.play("hunter")
	else:
		mov.y = 0  # Zera a velocidade vertical ao tocar o chão

	# Movimento lateral (esquerda/direita) se não estiver atirando
	if not atirando:
		if Input.is_action_pressed("ui_left"):
			mov.x = -velocidade
			$AnimatedSprite.flip_h = true
			direcao = -1
			$AnimatedSprite.play("run")
			
		elif Input.is_action_pressed("ui_right"):
			mov.x = velocidade
			$AnimatedSprite.flip_h = false
			direcao = 1
			$AnimatedSprite.play("run")

	# Pulo apenas quando está no chão
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		mov.y = -forca_pulo
		
		
		

	# Verifica se está no chão
	if is_on_floor():
		pulando = false
		if not atirando:
			if mov.x == 0:
				$AnimatedSprite.play("idle")
			# Atira se o botão de disparo for pressionado
			if Input.is_action_just_pressed("disparo"):
				$AnimationPlayer.play("atacando")
				atirando = true
				if mana > 10:mana = mana - 10
	
				emit_signal("player_stats_changed",self)

		# Verifica se a animação de ataque terminou
		if not $AnimationPlayer.is_playing():
			atirando = false
		
	mov = move_and_slide(mov, Vector2(0, -1))



func disparar(anim_name):
		
	if (anim_name=="atacando"):
		var cena_disparo = preload("res://cenas/cena_disparo.tscn")
		var obj_disparo  = cena_disparo.instance()
		
		get_tree().root.add_child(obj_disparo)
		
		if (direcao==1):
			obj_disparo.global_position = $Position2DDir.global_position
		elif (direcao==-1):
			obj_disparo.global_position = $Position2DEsq.global_position
		
		obj_disparo.get_node("Area2D").direcao = direcao






