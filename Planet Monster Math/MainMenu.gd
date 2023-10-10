extends Control


func _ready() -> void:
	get_tree().paused = false


func _on_PlayButton_pressed() -> void:
	$PlayButton/PressedSound.play()
	yield($PlayButton/PressedSound, "finished")
	get_tree().change_scene("res://Level.tscn")


func _on_CustomizeButton_pressed() -> void:
	$CustomizeButton/PressedSound.play()
	yield($CustomizeButton/PressedSound, "finished")
	get_tree().change_scene("res://CustomizationArea.tscn")


func _on_SettingsButton_pressed() -> void:
	$SettingsButton/PressedSound.play()
	yield($SettingsButton/PressedSound, "finished")
	get_tree().change_scene("res://Settings.tscn")
