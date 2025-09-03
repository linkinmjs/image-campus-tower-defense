@tool
extends Control

func entrar():
	find_child("AnimationPlayer", true).play("new_animation")
	$Nodos.visible = false

func accion_primaria():
	if not $Nodos.visible:
		$Nodos.visible = true
		$Nodos.pivot_offset = $Nodos.size / 2.0
		create_tween().tween_property($Nodos, "scale", Vector2.ONE, 1.0)\
			.from(Vector2.ZERO).set_trans(Tween.TRANS_ELASTIC)
		return true 
	return false
