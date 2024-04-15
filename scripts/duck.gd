extends CharacterBody2D

@export var speed = 50
var mouse_position = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	$DuckSprite/AnimationPlayer.play("idle")
	var options = [Vector2(160, -16), Vector2(160, 336), Vector2(336, 160), Vector2(-16, 160)]
	var rand_index:int = randi() % options.size()
	position = options[rand_index]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var previous_velocity = velocity
	var previous_mouse_position = mouse_position

	mouse_position = get_global_mouse_position()
	
	if abs(mouse_position.x - position.x) >= 1 and abs(mouse_position.y - position.y) >= 1:
		var direction = (mouse_position - position).normalized()

		velocity = direction * speed
		if velocity != Vector2.ZERO:
			$DuckSprite/AnimationPlayer.play("walk")
			
		if direction.x > 0:
			$DuckSprite.flip_h = true
		else:
			$DuckSprite.flip_h = false

		move_and_slide()
