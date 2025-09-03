@tool
extends Control

@onready var flecha: Polygon2D = $Flecha
@export var rotation_speed_in_degrees = 200
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var marker_2d: Marker2D = $Flecha/Marker2D
@onready var remote_transform_2d: RemoteTransform2D = $Flecha/Marker2D/RemoteTransform2D
var puede_mover_flechita = false

func entrar():
	create_tween().tween_property(
		sprite_2d,
		"global_position",
		marker_2d.global_position,
		1.0).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT).finished.connect(self.on_tween_finished)

func on_tween_finished():
	puede_mover_flechita = true
	remote_transform_2d.update_position = true
	remote_transform_2d.update_rotation = true

func salir():
	puede_mover_flechita = false
	remote_transform_2d.update_position = false
	remote_transform_2d.update_rotation = false

func accion_secundaria_continua(delta):
	if puede_mover_flechita:
		flecha.rotate(delta * deg_to_rad(rotation_speed_in_degrees))

func accion_terciaria_continua(delta):
	if puede_mover_flechita:
		flecha.rotate(-delta * deg_to_rad(rotation_speed_in_degrees))

func _process(delta: float) -> void:
	if not visible:
		remote_transform_2d.update_position = false
		remote_transform_2d.update_rotation = false
	flecha.offset = Vector2(400 * max(0.25, abs(cos(flecha.rotation))), 0)
	marker_2d.global_position = flecha.to_global(flecha.offset + Vector2(150, 0))
	marker_2d.global_rotation = 0
 
