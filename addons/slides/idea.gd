@tool
extends Node2D
@onready var sprite: Sprite2D = $RigidBody2D/Sprite
const IDEA_ROTA = preload("res://addons/slides/imagenes/ideaRota.png")
@onready var rigid_body_2d: RigidBody2D = $RigidBody2D

func break_idea():
	sprite.texture = IDEA_ROTA
	modulate = Color.BLACK

func _ready():
	rigid_body_2d.body_entered.connect(func(body):
		if randf() > 0.05:
			self.break_idea()
		else:
			rigid_body_2d.set_deferred("freeze", true)
			rigid_body_2d.set_deferred("collision_layer", 0)
			create_tween().tween_property(self, "position:x", -1500.0, 1.0).as_relative().set_trans(Tween.TRANS_ELASTIC)
			create_tween().tween_property(self, "scale", Vector2.ONE * 1.5, 1.0).set_trans(Tween.TRANS_ELASTIC),
		CONNECT_ONE_SHOT
	)
