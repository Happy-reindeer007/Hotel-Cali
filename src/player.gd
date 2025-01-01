extends Area2D

var entered_mob
var walk
var mob_in_area
signal ghost_killed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("walk")
	walk = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("kill_ghost"):
		if $KillCooldown.time_left == 0:
			$AnimationTimer.start()
			$AnimatedSprite2D.play("kill_ghost")
			walk = false
			if mob_in_area:
				ghost_killed.emit()
	if walk:
		if self.position.x < 160:
			position.x += 0.05
		else:
			position.x += 0.4
			$AnimatedSprite2D.play("walk", 2)


func _on_lightarea_area_entered(area: Area2D) -> void:
	if area != self:
		mob_in_area = true
		entered_mob = area

func _on_animation_timer_timeout() -> void:
	walk = true
	$AnimatedSprite2D.play("walk")
	$KillCooldown.start()
