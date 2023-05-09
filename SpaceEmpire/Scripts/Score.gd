extends Label

var  score = 0 

func _on_Astra_destroyed():
	score += 1
	text = "Score: %s" % score
	print(score)
