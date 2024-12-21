extends CharacterBody2D

@onready var grounded: bool = false 
# Configurações



var gravity := 800
var jump_force := -500
var speed := 600



func _physics_process(delta):
	# Aplicar gravidade
	if !grounded: 
		velocity.y += gravity * delta
	else: 
		velocity.y = 0 
	# Movimento horizontal
	velocity.x = speed
	if grounded:
		

	# Pulo ao pressionar barra de espaço
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = jump_force

	# Mover e verificar colisões
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "Chao":
		#gravity = 0
		print("bateu")
		grounded = true 
	if area.is_in_group("Fanclube"):
		morre()
		


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "Chao":
		#gravity = 800
		print("Batida")
		grounded= false

func morre(): 
	
	Global.kombitem = false
	if Global.score > Global.highscore:
		Global.highscore = Global.score
	
	print("morreu") 
	await get_tree().create_timer(0.1).timeout
	
	queue_free()
	
	
