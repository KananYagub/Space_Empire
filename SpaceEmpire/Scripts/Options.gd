extends Control

export (NodePath) var dropdown_path
onready var dropdown = get_node(dropdown_path)




func _ready():
	add_items()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func add_items():
	dropdown.add_item("Normal")
	dropdown.add_item("Easy")
	dropdown.add_item("Hard")

func _on_Back_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")


func _on_OptionButton_item_selected(index):
	
	if (index== 1):
		globalvar.player_speed = 150
		globalvar.asteroid_speed_min = 150
		globalvar.asteroid_speed_max = 250
		#print(globalvar.player_speed)
	
	if (index== 2):
		globalvar.player_speed = 100
		globalvar.asteroid_speed_min = 250
		globalvar.asteroid_speed_max = 350
		#print(globalvar.player_speed)
