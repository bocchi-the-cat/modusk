extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/ui_scene/hotbar_under.hide()
	$CanvasLayer/ui_scene/money.show()
	$VideoStreamPlayer.hide()
	$VideoStreamPlayer.stop()
	Globals.textbox = "UGHHHHHHHHHHHHHHHH"
	await Globals.wait(3)
	Globals.textbox = "one last chance, I've lost all my money and the debt money DUE TO THIS STUPID GAMBLING ADDICTION"
	await Globals.wait(5)
	$aether_dialogue_box.hide()
	$VideoStreamPlayer.show()
	$VideoStreamPlayer.play()
	Globals.money = -100
	await Globals.wait(14)
	$VideoStreamPlayer.stop()
	$VideoStreamPlayer.hide()
	$aether_dialogue_box.show()
	
	#done first part and video
	
	Globals.textbox = "IM SO SCREWED"
	await Globals.wait(3)
	Globals.textbox = "Last thing I can do is run away and hope i can get the money back"
	
