extends CharacterBody2D

func moverse() -> void:
	velocity = Vector2(1, -1).normalized() * 500.0

func frenar() -> void:
	velocity = Vector2.ZERO
	
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision and collision.get_collider():
		velocity = velocity.bounce(collision.get_normal())
