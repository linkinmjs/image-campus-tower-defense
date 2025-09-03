@tool
extends WithActionList

func entrar():
	action_list.actions = [
		Action.play_animation($Runa/AnimationPlayer, "entrar"),
		Action.play_animation($UTN/AnimationPlayer, "entrar"),
		Action.play_animation($ImageCampus/AnimationPlayer, "entrar")
	]
