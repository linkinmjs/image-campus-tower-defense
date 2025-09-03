@tool
extends Control

func entrar():
	create_tween().tween_property(
		$Preguntas,
		"scale",
		Vector2.ONE,
		1.5
	).from(Vector2.ZERO).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	
