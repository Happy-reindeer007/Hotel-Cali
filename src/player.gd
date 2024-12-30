extends Area2D

signal attack

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("walk")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += 0.05
	if Input.is_action_pressed("kill_ghost"):
		if $KillCooldown.time_left == 0:
			$KillCooldown.start()
			pass
	
