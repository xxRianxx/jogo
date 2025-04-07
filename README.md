# 🧙‍♂️ Mago das Sombras - Jogo 2D em Godot 3.5

Este é um jogo 2D de plataforma desenvolvido como parte de um projeto acadêmico utilizando o motor **Godot Engine 3.5**. O jogador controla um mago em uma jornada por 4 fases, enfrentando inimigos e superando obstáculos com habilidades mágicas e movimentação ágil.

---

## 🎮 Sobre o Jogo

Você controla um mago que pode:
- 🧭 Andar para os lados
- 🕴️ Pular (com direito a **pulo duplo**)
- 🔥 Atirar projéteis mágicos (consome mana)
- 💥 Interagir com inimigos (causando e recebendo dano)
- ♻️ Regenerar **vida** e **mana** com o tempo

O jogo possui **quatro fases** com desafios progressivos, inimigos únicos e ambientes variados.

---

## 🧠 Mecânicas Implementadas

### 🎯 Movimentação
- Andar para esquerda/direita
- Pulo duplo com controle de gravidade e colisão
- Animações de pulo, corrida, ataque e ocioso

### 🧪 Combate
- Sistema de **disparo mágico** que consome mana
- Animação de ataque sincronizada com o projétil
- Direção do disparo com base no lado em que o jogador está virado

### 💖 Vida e Mana
- Sistema de **vida e mana** com valores máximos
- Regeneração gradual de ambos os atributos ao longo do tempo
- Emissão de sinal sempre que os atributos são alterados

### 💡 Inteligência e Interação
- Sistema de colisão entre projéteis e inimigos
- Sinal de atualização de status para uso em HUDs ou lógica de jogo

---

## 🛠️ Tecnologias Utilizadas

- 🎮 [Godot Engine 3.5](https://godotengine.org/)
- 📜 GDScript
- 🎨 Sprites 2D animados
- 🧩 Sistema de cenas e instâncias

---

## 🎮 Controles

| Ação              | Tecla padrão  |
|-------------------|---------------|
| Mover             | ← / →         |
| Pular             | ↑             |
| Atacar (disparo)  | Tecla "X"     |

> Os controles podem ser configurados nas ações do projeto (Input Map).
