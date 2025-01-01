extends Node2D

var new_mob = preload("res://Scenes/Mob.tscn")
var rng = RandomNumberGenerator.new()
var mobs = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_mob_spawner_timer_timeout() -> void:
	# Randomizes the time it takes for a mob to spawn
	if $Player.position.x < 160: 
		var randfloat = rng.randf_range(3.0, 9.0)
		$MobSpawnerTimer.wait_time = randfloat
		
		# Creates an instance of the mob and sets position
		var mob_instance = new_mob.instantiate()
		mob_instance.position = Vector2(180, 90)
		
		# Picks a random skin/animation
		var mob_skins = mob_instance.get_node("AnimatedSprite2D").sprite_frames.get_animation_names()
		var randint = rng.randi_range(0, 2)
		mob_instance.get_node("AnimatedSprite2D").play(mob_skins[randint])
		
		# Add child
		mobs.append(mob_instance)
		add_child(mob_instance)
		$MobSpawnerTimer.start()


func _on_player_hit(area: Area2D) -> void:
	if area != $Player.get_node("Lightarea"):
		$Player.position.x = 7
		for mob_instance in mobs:
			mob_instance.queue_free()
		mobs = []


func _on_player_ghost_killed() -> void:
	mobs[0].queue_free()
	mobs.remove_at(0)
