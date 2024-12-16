extends Node2D

@onready var sprite = $Sprite2D  # Certifique-se de que o Sprite2D está corretamente como filho do Node2D ou StaticBody2D

func _ready():
	var screen_size = get_viewport().size
	var sprite_width = sprite.texture.get_width()
	
	sprite.scale.x = screen_size.x / sprite_width

	for i in range(1, int(sprite.scale.x)):
		var new_sprite = sprite.duplicate()
		new_sprite.position.x = sprite_width * i
		add_child(new_sprite)
