extends CanvasLayer

onready var Resume = $VBoxContainer/Resume
func _ready(): false

func _process(delta): 	pass

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"): # "ui_cancel" é o padrão para ESC
		visible = true
		get_tree().paused= true
		Resume.grab_focus()
	
	

# Função chamada quando o botão "Resume" é pressionado
func _on_Resume_pressed():
	get_tree().paused = false
	visible = false

# Função chamada quando o botão "Quit" é pressionado
func _on_Quit_Game_pressed():
	 get_tree().quit()

