class_name EnemyHitbox
extends Area2D

signal received_damage

func was_shoot() -> void:
	get_parent().queue_free()
