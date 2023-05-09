extends RigidBody2D



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var explosion = preload("res://Scenes/Explosion.tscn")

# Called when the node enters the scene tree for the first time.



func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Bullet_body_entered(body):

	if body.is_in_group("player"):
		print("You hit player")
	if !body.is_in_group("player"):
		print("Bullet entered asteroid (bullet)")
	queue_free()
		


func _on_Area2D_area_entered(area):
	if  area.is_in_group("asteroid"):
		print("Asteroid Area entered")
		queue_free()
