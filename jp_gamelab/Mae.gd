extends Node2D

var some: bool = true 
var clube: Array = [] 
@onready var Fan = load("res://fan.tscn")
@onready var label2: Label = %score2
@onready var label: Label =  %score
@onready var chao = $Chao
@onready var kombi = $Kombi
var screensize: Vector2i
var fan2




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	some = true 
	Global.kombitem = true
	screensize = get_window().size
	label2.text = str(Global.highscore)
	Global.score = 0
	while  some: 
		var Aletime = randf_range(1,3)
		await get_tree().create_timer(Aletime).timeout 
		fan2 = Fan.instantiate()
		if is_instance_valid(kombi): 
			var PIRANHA = Vector2(kombi.position.x + 1000, 877)
			fan2.position = PIRANHA  
		else:
			print("Kombi liberada")
		get_parent().add_child(fan2)
		await get_tree().create_timer(2).timeout
		
		
		print("VAI PIRANHA")
		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.kombitem:
		
		if kombi.position.x - chao.position.x > screensize.x/1.5:
			chao.position.x += screensize.x
	
	else: 
		some = false 
		$CanvasLayer.show_gameover()
		


func _on_score_timer_timeout() -> void:
	if Global.kombitem:
		Global.score += 1
		label.text = str(Global.score)
