extends Node2D

var planet_1 = preload("res://Planets/Planet1.tscn")
var planet_2 = preload("res://Planets/Planet2.tscn")
var planet_3 = preload("res://Planets/Planet3.tscn")
var planet_4 = preload("res://Planets/Planet4.tscn")
var planet_5 = preload("res://Planets/Planet5.tscn")
var planet_6 = preload("res://Planets/Planet6.tscn")
var planet_7 = preload("res://Planets/Planet7.tscn")
var planet_8 = preload("res://Planets/Planet8.tscn")
var planet_9 = preload("res://Planets/Planet9.tscn")

var planets = [planet_1, planet_2, planet_3, planet_4, planet_5, planet_6, planet_7, planet_8, planet_9]

var answer_chosen = 0

var hearts = 3
var score = 0


func _ready() -> void:
	get_tree().paused = false
	
	$Hearts/Heart1.visible = true
	$Hearts/Heart1Broken.visible = false
	$Hearts/Heart2.visible = true
	$Hearts/Heart2Broken.visible = false
	$Hearts/Heart3.visible = true
	$Hearts/Heart3Broken.visible = false
	
	$EndScreen.visible = false


func _process(delta: float) -> void:
	# Changes the text in the answer bubble to reflect the answer chosen
	$Player/AnswerBubble/Label.text = str(answer_chosen)
	
	# Changes the score text to reflects the score
	$Score/Amount.text = str(score)
	
	# Changes the hearts to reflect how many hearts you have
	if hearts == 2:
		$Hearts/Heart1.visible = false
		$Hearts/Heart1Broken.visible = true
	if hearts == 1:
		$Hearts/Heart2.visible = false
		$Hearts/Heart2Broken.visible = true
	if hearts == 0:
		$Hearts/Heart3.visible = false
		$Hearts/Heart3Broken.visible = true
	
	# Makes the game over screen appear when you run out of hearts
	if hearts == 0:
		$EndScreen/GameOverSound.play()
		$EndScreen/Score/Amount.text = str(score)
		$EndScreen.visible = true
		get_tree().paused = true


# Changes answer_chosen to the answer that the player chose
func _on_Choice0_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		answer_chosen = int($Choices/Choice0/Label.text)
		$Choices/Choice0/AudioStreamPlayer.play()


func _on_Choice1_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		answer_chosen = int($Choices/Choice1/Label.text)
		$Choices/Choice1/AudioStreamPlayer.play()


func _on_Choice2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		answer_chosen = int($Choices/Choice2/Label.text)
		$Choices/Choice2/AudioStreamPlayer.play()


func _on_Choice3_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		answer_chosen = int($Choices/Choice3/Label.text)
		$Choices/Choice3/AudioStreamPlayer.play()


func _on_Choice4_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		answer_chosen = int($Choices/Choice4/Label.text)
		$Choices/Choice4/AudioStreamPlayer.play()


func _on_Choice5_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		answer_chosen = int($Choices/Choice5/Label.text)
		$Choices/Choice5/AudioStreamPlayer.play()


func _on_Choice6_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		answer_chosen = int($Choices/Choice6/Label.text)
		$Choices/Choice6/AudioStreamPlayer.play()


func _on_Choice7_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		answer_chosen = int($Choices/Choice7/Label.text)
		$Choices/Choice7/AudioStreamPlayer.play()


func _on_Choice8_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		answer_chosen = int($Choices/Choice8/Label.text)
		$Choices/Choice8/AudioStreamPlayer.play()


func _on_Choice9_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		answer_chosen = int($Choices/Choice9/Label.text)
		$Choices/Choice9/AudioStreamPlayer.play()


# Spawns planets
func _on_SpawnTimer_timeout() -> void:
	randomize()
	var random_planet = planets[randi() % planets.size()]
	var get_planet = random_planet.instance()
	randomize()
	get_planet.position = Vector2(randi() % 1920, -130)
	if get_planet.position.x < 140:
		get_planet.position.x = 140
	if get_planet.position.x > 1780:
		get_planet.position.x = 1780
	$Planets.add_child(get_planet)


#Checks if answer is correct
func _on_AnswerBubble_body_entered(body: Node) -> void:
	# Adds a point if the answer is correct
	if int(body.answer) == answer_chosen:
		score += 1
		$Player/RightAnswerSound.play()
	# Removes a heart if the answer is wrong
	else:
		hearts -= 1
		$Player/WrongAnswerSound.play()
	body.queue_free()


# Removes the planet and 1 heart when the planet hits the floor
func _on_DesctructionArea_body_entered(body: Node) -> void:
	$DesctructionArea/AudioStreamPlayer.play()
	body.queue_free()
	hearts -= 1


# Changes to the scene to main menu
func _on_Home_pressed() -> void:
	$EndScreen/Home/PressedSound.play()
	yield($EndScreen/Home/PressedSound, "finished")
	get_tree().paused = false
	get_tree().change_scene("res://MainMenu.tscn")


# Reloads the scene
func _on_Replay_pressed() -> void:
	$EndScreen/Replay/PressedSound.play()
	yield($EndScreen/Replay/PressedSound, "finished")
	get_tree().paused = false
	get_tree().reload_current_scene()
