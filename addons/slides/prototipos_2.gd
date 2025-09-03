@tool
extends Control
const IDEA = preload("res://addons/slides/idea.tscn")

var ideas_tiradas = []

func entrar():
	PhysicsServer2D.set_active(true)

func salir():
	PhysicsServer2D.set_active(false)
	for idea in ideas_tiradas:
		idea.queue_free()
	ideas_tiradas.clear()

func accion_primaria():
	var idea = IDEA.instantiate()
	add_child(idea)
	idea.position = $Idea.position + Vector2.UP * 20.0
	var rigid_body: RigidBody2D = idea.get_node("RigidBody2D")
	rigid_body.freeze = false
	rigid_body.apply_impulse(Vector2(2500.0, randf_range(-500, 500)))
	ideas_tiradas.push_back(idea)
	

func accion_secundaria():
	pass
