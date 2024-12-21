extends CanvasLayer



func show_gameover():
	$RestartBTN.show()
	$Button.show()



func _on_restart_btn_pressed() -> void:
	emit_signal("gameover")
	get_tree().change_scene_to_file("res://kombi.tscn")
	#$RestartBTN.hide()
	print("Apertou")


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://UIinicio.tscn")
