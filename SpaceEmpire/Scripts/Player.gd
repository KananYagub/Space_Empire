extends KinematicBody2D

var speed = globalvar.player_speed
export var bullet_speed = 1000
export var fire_rate = 0.2
var screen_size = Vector2.ZERO

var can_fire = true

var bullet1 = preload("res://Scenes/Bullet1.tscn")
var bullet2 = preload("res://Scenes/Bullet2.tscn")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport().size
	

func _process(delta):
	look_at(get_global_mouse_position())
	
	if  Input.is_action_pressed("fire") and can_fire:
		var bullet_instance = bullet1.instance()
		$Bullet_noise.play()
		bullet_instance.position = $Bullotpoint.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate),"timeout")
		can_fire = true
		$Bullet_noise.stop()
	
	
func _physics_process(delta):
	var direction = Vector2()
	if Input.is_action_pressed("move_up"):
		$ThrusterL2.play("Thruster")
		$ThrusterR2.play("Thruster")
		direction += Vector2(0,-1)
	if Input.is_action_pressed("move_down"):
		$ThrusterL2.play("Thruster")
		$ThrusterR2.play("Thruster")
		direction += Vector2(0, 1)
	if Input.is_action_pressed("move_left"):
		$ThrusterL2.play("Thruster")
		$ThrusterR2.play("Thruster")
		direction += Vector2(-1, 0)
	if Input.is_action_pressed("move_right"):
		$ThrusterL2.play("Thruster")
		$ThrusterR2.play("Thruster")
		direction += Vector2(1, 0)
	if Input.is_action_pressed("speed_up"):
		speed += 50
	
	
	move_and_slide(direction * speed)
	#print(speed)
	
	position.x = clamp(position.x,-1700,1110)
	position.y = clamp(position.y,-1255,1500)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Explosion_animation_finished():
	print("Boom")
	queue_free()
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	
func _on_Area2D_area_entered(area):
	if !area.is_in_group("bullet"):
		$Explosion.play("Explosion")
	

func _on_ThrusterR2_animation_finished():
	$ThrusterL2.play("Default")
	$ThrusterR2.play("Default")

func _on_ThrusterL2_animation_finished():
	pass


func _on_AnimatedSprite_animation_finished():
	pass # Replace with function body.
