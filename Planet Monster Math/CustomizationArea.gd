extends Node2D


func _ready() -> void:
	get_tree().paused = false


func _on_Button_pressed() -> void:
	$Button/PressedSound.play()
	yield($Button/PressedSound, "finished")
	get_tree().change_scene("res://MainMenu.tscn")
