@tool
extends Control

@onready var action_list: ActionList = ActionList.new()

func _process(delta: float):
	action_list.process(delta)

func entrar():
	self.close_all_and_open_2d()
	action_list.actions = [
		Action.new({
			"do":
				(func():
					do_on_next_frame(func(): EditorInterface.open_scene_from_path(
						"res://ejemplos/tool/cosito_giratorio.tscn"
					)))
		}),
		Action.new({
			"do": (func(): do_on_next_frame(self.open_script)),
			"undo":
				func(): do_on_next_frame(func(): close_all_and_open_2d())
		}),
		Action.new({
			"do":
				(func():
					do_on_next_frame(func():
						var code_edit: CodeEdit = EditorInterface.get_script_editor().get_current_editor().find_children("", "CodeEdit", true, false).front()
						code_edit.insert_line_at(0, "@tool")
						))
		, "undo": (func():
					do_on_next_frame(func():
						EditorInterface.get_script_editor().goto_line(0)
						var code_edit: CodeEdit = EditorInterface.get_script_editor().get_current_editor().find_children("", "CodeEdit", true, false).front()
						code_edit.remove_line_at(0)
						))
		}),
		Action.new({
			"do": func(): do_on_next_frame(self.close_all_and_open_2d)
		, "undo": func(): do_on_next_frame(self.open_script)
		}),
	]
	#action_list.actions = [
		#Action.new({
			#"do": func():
				#Utils.find_control(["DockHSplitLeftL", "Scene"]).modulate.b = 0.0,
			#"undo": (func():
				#Utils.find_control(["DockHSplitLeftL", "Scene"]).modulate.b = 1.0)
		#}),
		#Action.new({
			#"do": (func():
				#Utils.find_control(["DockHSplitLeftL", "Scene"]).modulate.b = 1.0
				#if "res://addons/slides/diapositivas.tscn" in EditorInterface.get_open_scenes():
					#return
				#Utils.find_control(["DockHSplitLeftL", "Scene"])\
				#.find_children("", "Button", true, false)\
				#.filter(func(button): return "2D Scene" in button.text)[0].pressed.emit()),
		#}),
		#Action.hacer_visible(un_nodo_es_un_objeto),
		#Action.hacer_visible(estado_interno),
		#Action.hacer_visible(metodos),
		#Action.hacer_visible(herencia),
		#Action.hacer_visible(__objetos_)
	#]

func open_script():
	var script = load("res://ejemplos/tool/logito.gd")
	EditorInterface.edit_script(script)
	do_on_next_frame(func(): EditorInterface.get_base_control().find_child("Script", true, false).pressed.emit())

func accion_primaria():
	return action_list.do()

func accion_secundaria():
	return action_list.undo()

func close_all():
	if "res://addons/slides/diapositivas.tscn" in EditorInterface.get_open_scenes():
		return
	var tab_bar: TabBar = EditorInterface.get_base_control()\
		.find_child("*EditorSceneTabs*", true, false)\
		.find_child("*TabBar*", true, false)
	for i in tab_bar.tab_count:
		tab_bar.tab_close_pressed.emit(i)
	

func close_all_and_open_2d():
	close_all()
	do_on_next_frame(func():
		EditorInterface.get_base_control().find_child("2D", true, false).pressed.emit()
	)

func do_on_next_frame(callback):
	get_tree().process_frame.connect(callback, CONNECT_ONE_SHOT)
