extends Area2D
var mob_killable
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
	


func _on_lightarea_area_entered(area: Area2D) -> void:
	if area != self:
		mob_killable = true
		print(mob_killable)

func _on_lightarea_area_exited(area: Area2D) -> void:
	mob_killable = false
	print(mob_killable)
