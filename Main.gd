extends Node2D

var new_mob = load("res://Scenes/Mob.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MobSpawnerTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_mob_spawner_timer_timeout() -> void:
	#Randomizes the time it takes for a mob to spawn
	var rng = RandomNumberGenerator.new()
	var randfloat = rng.randf_range(0.5, 5.0)
	$MobSpawnerTimer.wait_time = randfloat
	
	#Creates an instance of the mob scene and adds it to the Main scene
	var mob_instance = new_mob.instantiate
	add_child(mob_instance)
	
