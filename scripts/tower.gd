extends Node2D

@onready var area_2d: Area2D = $Area2D
@onready var cannon: Node2D = $Cannon


var enemies = []

func _ready() -> void:
	area_2d.area_entered.connect(on_area_entered)
	area_2d.area_exited.connect(on_area_exited)
	
func on_area_entered(an_area: Area2D) -> void:
	print("entró avión")
	enemies.push_back(an_area)
	
func on_area_exited(an_area: Area2D) -> void:
	enemies.erase(an_area)
	
func _process(delta: float) -> void:
	if enemies.is_empty():
		return
	var enemy = enemies.front()
	cannon.look_at(enemy.global_position)
