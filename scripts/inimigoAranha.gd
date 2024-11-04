extends KinematicBody2D

onready var personagem = get_node('../personagem')
onready var sprite = $AnimatedSprite  # Referência ao sprite do inimigo

func _physics_process(delta):
	
	var vetor_ate_personagem = personagem.global_position - global_position
	move_and_slide(vetor_ate_personagem.normalized() * 80)

	
	if vetor_ate_personagem.x > 0:
		sprite.flip_v = true  
	else:
		sprite.flip_v = false  
