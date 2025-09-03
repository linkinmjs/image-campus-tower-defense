@tool
extends WithActionList

func entrar():
	action_list.actions = [
		Action.new({
			"do":
				func(): EditorInterface.get_script_editor().goto_help("EditorPlugin")
		})
	]
