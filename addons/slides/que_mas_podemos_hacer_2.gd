@tool
extends WithActionList

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func entrar():
	animation_player.play("new_animation")

func salir():
	animation_player.play("RESET")
	
