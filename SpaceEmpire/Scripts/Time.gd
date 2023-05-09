extends Label

var lifespan = 0


signal level_up



func _on_Lifespan_timeout():
	lifespan += 1
	#print("Lifespan:", lifespan, "seconds")
	text = "Time: %s" % lifespan
	
	if (typeof(lifespan %20) == TYPE_INT ):
		emit_signal("level_up")
		#player.speed = 0
		print("speed is 50")
		

