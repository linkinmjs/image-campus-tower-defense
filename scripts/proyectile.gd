extends Area2D

@export var speed: float = 1000.0
@export var velocity: Vector2 = Vector2.RIGHT

func _ready() -> void:
	area_entered.connect(on_area_entered)
	rotation = velocity.angle()

func _process(delta: float) -> void:
	global_position += velocity * delta

func on_area_entered(area: EnemyHitbox) -> void:
	area.was_shoot()
	queue_free()

func be_shot(a_velocity) -> void:
	velocity = a_velocity
	rotation = a_velocity.angle()
