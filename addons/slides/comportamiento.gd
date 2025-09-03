@tool
extends WithActionList
@onready var tipo_de_nodo: Label = $TipoDeNodo
@onready var script_label: Label = $Script

func entrar():
	tipo_de_nodo.visible = false
	script_label.visible = false
	action_list.actions = [
		Action.hacer_visible(tipo_de_nodo),
		Action.hacer_visible(script_label),
		Action.hacer_visible(tipo_de_nodo).opposite(),
	]
