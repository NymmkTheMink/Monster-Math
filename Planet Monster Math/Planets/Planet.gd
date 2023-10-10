extends RigidBody2D

var answer = 0

# Ranges from 0 to 1
var number_1 = 0
# Ranges from 0 to 1
var number_2 = 0

func _ready() -> void:
	# Generates random equation
	randomize()
	number_1 = int(rand_range(0, 9))
	number_2 = int(rand_range(0, 9))
	
	answer = number_1 + number_2
	
	# Regenerates the equation til the solution is 9 or less
	while answer > 9:
		randomize()
		number_1 = rand_range(0, 9)
		number_2 = rand_range(0, 9)
		
		answer = int(number_1) + int(number_2)
	
	
	$Number1.text = str(int(number_1))
	$Number2.text = str(int(number_2))
