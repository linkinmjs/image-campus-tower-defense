@tool
extends Control

@onready var logito: CharacterBody2D = $StaticBody2D/Logito
@onready var remote_transform_2d: RemoteTransform2D = $StaticBody2D/Logito/Sprite2D/RemoteTransform2D

func _ready():
	logito.moverse()

func entrar():
	logito.moverse()
	remote_transform_2d.update_position = true

func salir():
	remote_transform_2d.update_position = false
	logito.frenar()
