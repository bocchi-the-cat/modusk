extends Node


var money: int = -95
var textbox: String = ""

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
