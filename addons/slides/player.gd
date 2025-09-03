extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * 200.0
	move_and_slide()
	
	if velocity.is_zero_approx():
		animated_sprite_2d.play("idle")
	else:
		animated_sprite_2d.play("walk")
		animated_sprite_2d.flip_h = velocity.x < 0
