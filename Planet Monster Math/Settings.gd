extends Control

var mute_music_icon = preload("res://assets/Kenney_gameIcons/PNG/White/2x/musicOff.png")
var music_icon = preload("res://assets/Kenney_gameIcons/PNG/White/2x/musicOn.png")
var mute_sound_effects_icon = preload("res://assets/Kenney_gameIcons/PNG/White/2x/audioOff.png")
var sound_effects_icon = preload("res://assets/Kenney_gameIcons/PNG/White/2x/audioOn.png")

var music_bus = AudioServer.get_bus_index("Music")
var sound_effects_bus = AudioServer.get_bus_index("SoundEffects")


func _ready() -> void:
	get_tree().paused = false


func _on_Music_pressed() -> void:
	$Music/PressedSound.play()
	AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus)) 
	if AudioServer.is_bus_mute(music_bus) == true:
		$Music.icon = mute_music_icon
	if AudioServer.is_bus_mute(music_bus) == false:
		$Music.icon = music_icon


func _on_SoundEffects_pressed() -> void:
	$SoundEffects/PressedSound.play()
	AudioServer.set_bus_mute(sound_effects_bus, not AudioServer.is_bus_mute(sound_effects_bus)) 
	if AudioServer.is_bus_mute(sound_effects_bus) == true:
		$SoundEffects.icon = mute_sound_effects_icon
	if AudioServer.is_bus_mute(sound_effects_bus) == false:
		$SoundEffects.icon = sound_effects_icon


func _on_Back_pressed() -> void:
	$Back/PressedSound.play()
	yield($Back/PressedSound, "finished")
	get_tree().change_scene("res://MainMenu.tscn")
