extends Area2D

var velocidade = 400  # Velocidade do disparo
var direcao = Vector2.ZERO  # Direção em que o disparo se moverá

# Timer para destruir o disparo
onready var timer = Timer.new()

func _ready():
	# Adiciona o timer à cena
	add_child(timer)
	timer.wait_time = 5.0  # Tempo antes da destruição
	timer.one_shot = true
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.start()

# Função chamada quando o Timer emite o sinal timeout
func _on_Timer_timeout():
	queue_free()  # Destroi o disparo após 2 segundos

# Função para atualizar a posição do disparo
func _process(delta):
	# Move o disparo na direção definida
	position += direcao * velocidade * delta

# Função para lidar com a colisão
func _on_Area2D_body_entered(body):
	if body.name == "personagem":  # Verifica se o disparo colidiu com o jogador (personagem principal)
		queue_free()  # Destroi o disparo após a colisão
