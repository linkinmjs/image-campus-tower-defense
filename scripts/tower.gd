extends Node2D

const PROYECTILE = preload("res://scenes/proyectile.tscn")

@onready var area_2d: Area2D = $Area2D
@onready var cannon: Node2D = $Cannon
@onready var shoot_timer: Timer = $ShootTimer

var enemies = []
var can_shoot: bool = true

func _ready() -> void:
	area_2d.area_entered.connect(on_area_entered)
	area_2d.area_exited.connect(on_area_exited)
	shoot_timer.timeout.connect(shoot)
		
func on_area_entered(an_area: Area2D) -> void:
	enemies.push_back(an_area)
	
func on_area_exited(an_area: Area2D) -> void:
	enemies.erase(an_area)
	
func shoot() -> void:
	var proyectile = PROYECTILE.instantiate()

	proyectile.rotation = Vector2.RIGHT.rotated(cannon.rotation)
	proyectile.speed = 500
	add_child(proyectile)

func _process(delta: float) -> void:
	if enemies.is_empty():
		return
	
	var enemy = enemies.front()
	cannon.look_at(enemy.global_position)
