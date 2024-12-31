extends Node2D

var new_mob = preload("res://Scenes/Mob.tscn")
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mob_spawner_timer_timeout() -> void:
	# Randomizes the time it takes for a mob to spawn
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
	add_child(mob_instance)
	$MobSpawnerTimer.start()
