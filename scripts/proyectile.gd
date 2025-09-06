extends Area2D

@export var speed: float = 200.0
@export var velocity: Vector2 = Vector2.RIGHT

	#rotation = direction.angle()

func _ready() -> void:
	area_entered.connect(on_area_entered)


func _process(delta: float) -> void:
	global_position += velocity * delta
	
func on_area_entered(area) -> void:
	area.was_shot()
	queue_free()
	
func be_shot(a_velocity) -> void:
	velocity = a_velocity
	rotation = a_velocity.angle()
