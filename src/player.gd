extends Area2D

signal game_over
var entered_mob
var walk
var mob_in_area

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("walk")
	walk = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("kill_ghost"):
		if $KillCooldown.time_left == 0:
			$AnimationTimer.start()
			$AnimatedSprite2D.play("kill_ghost")
			walk = false
			if mob_in_area:
				entered_mob.queue_free()
	if walk:
		position.x += 0.05


func _on_lightarea_area_entered(area: Area2D) -> void:
	if area != self:
		mob_in_area = true
		entered_mob = area

func _on_animation_timer_timeout() -> void:
	walk = true
	$AnimatedSprite2D.play("walk")
	$KillCooldown.start()
