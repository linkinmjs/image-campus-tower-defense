@tool
extends Control

func entrar():
	$PasarLista.pivot_offset = size / 4
	$AnimationPlayer.play("new_animation")
