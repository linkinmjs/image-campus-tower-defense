class_name  EnemyHitbox
extends Area2D

signal received_damage

func was_shoot() -> void:
	received_damage.emit()
