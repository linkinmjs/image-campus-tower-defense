extends Node2D

const PROYECTILE = preload("res://scenes/proyectile.tscn")

@onready var area_2d: Area2D = $Area2D
@onready var cannon: Node2D = $Cannon
@onready var shoot_timer: Timer = $ShootTimer
@onready var marker_2d: Marker2D = $Cannon/Marker2D

var enemies = []
var can_shoot: bool = true

func _ready() -> void:
	area_2d.area_entered.connect(on_area_entered)
	area_2d.area_exited.connect(on_area_exited)
	shoot_timer.timeout.connect(shoot)
	
func _process(delta: float) -> void:
	if enemies.is_empty():
		return
	var closest_enemy = _get_closest_enemy()
	cannon.look_at(closest_enemy.global_position)

func on_area_entered(an_area: Area2D) -> void:
	enemies.push_back(an_area)
	
func on_area_exited(an_area: Area2D) -> void:
	enemies.erase(an_area)
	
func shoot() -> void:
	var proyectile = PROYECTILE.instantiate()
	proyectile.be_shot(Vector2.RIGHT.rotated(cannon.rotation) * 500)
	proyectile.global_position = marker_2d.global_position
	marker_2d.add_child(proyectile)

func _get_closest_enemy() -> Node2D:
	var closest_enemy: Node2D = enemies.front()
	for enemy: Node2D in enemies:
		if enemy.global_position.distance_squared_to(global_position) < closest_enemy.global_position.distance_squared_to(global_position):
			closest_enemy = enemy
	return closest_enemy
