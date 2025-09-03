@tool
extends Control
@onready var un_nodo_es_un_objeto: Label = $"Un nodo es un objeto"
@onready var estado_interno: Label = $EstadoInterno
@onready var metodos: Label = $Metodos
@onready var herencia: Label = $Herencia
@onready var __objetos_: Label = $"¿Objetos?"

@onready var action_list: ActionList = ActionList.new()

func _process(delta: float):
	action_list.process(delta)

func entrar():
	un_nodo_es_un_objeto.visible = false
	estado_interno.visible = false
	metodos.visible = false
	herencia.visible = false
	__objetos_.visible = false
	
	self.close_all_and_open_2d()
	Utils.find_control(["DockHSplitLeftL", "Scene"]).modulate.b = 1.0
	action_list.actions = [
		Action.new({
			"do": func():
				Utils.find_control(["DockHSplitLeftL", "Scene"]).modulate.b = 0.0,
			"undo": (func():
				Utils.find_control(["DockHSplitLeftL", "Scene"]).modulate.b = 1.0)
		}),
		Action.new({
			"do": (func():
				Utils.find_control(["DockHSplitLeftL", "Scene"]).modulate.b = 1.0
				if "res://addons/slides/diapositivas.tscn" in EditorInterface.get_open_scenes():
					return
				Utils.find_control(["DockHSplitLeftL", "Scene"])\
				.find_children("", "Button", true, false)\
				.filter(func(button): return "2D Scene" in button.text)[0].pressed.emit()),
		}),
		Action.hacer_visible(un_nodo_es_un_objeto),
		Action.hacer_visible(estado_interno),
		Action.hacer_visible(metodos),
		Action.hacer_visible(herencia),
		Action.hacer_visible(__objetos_)
	]

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
