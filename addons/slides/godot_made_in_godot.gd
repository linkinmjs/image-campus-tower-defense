@tool
extends WithActionList
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func entrar():
	action_list.actions = [
		Action.play_animation(animation_player, "new_animation")
	]
