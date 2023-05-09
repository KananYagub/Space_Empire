extends RigidBody2D

signal destroyed




var min_speed = globalvar.asteroid_speed_min
var max_speed = globalvar.asteroid_speed_max

##Kanan

func destroy():
	emit_signal("destroyed")
	print("Destroyed signal emitted")
	$ExplosionAstra.play("Explosion")
	

func _on_Area2D_area_entered(area):
	if area.is_in_group("bullet"):
		$ExplosionAstra.play("Explosion")
		$Explosion_noise.play()
		print("Explosion happend by bullet")
		destroy()
		
	if area.is_in_group("astra"):
		$ExplosionAstra.play("Explosion")
	

func _on_ExplosionAstra_animation_finished():
	queue_free()


func _on_Asteroid_destroy():
	print("test")
	pass # Replace with function body.



