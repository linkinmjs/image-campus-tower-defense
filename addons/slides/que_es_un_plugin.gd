@tool
extends WithActionList

func entrar():
	action_list.actions = [
		Action.play_animation($AnimationPlayer, "new_animation"),
	]
