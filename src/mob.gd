extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if $AnimatedSprite2D.animation == "dino":
		$DefaultCollision.disabled = true
		$DinoCollision.disabled = false
	else:
		$DefaultCollision.disabled = false
		$DinoCollision.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		position.x -= 8 * delta
