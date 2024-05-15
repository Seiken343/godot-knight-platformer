extends Area2D

@onready var timer = $Timer
#to create the variable above, I dragged the Timer node into my script and 
  #held control while releasing. It auto generates the variable above to link to the timer
@onready var hurt_sound = $HurtSound

func _on_body_entered(body):
	print("You died!")
	hurt_sound.play()
	Engine.time_scale = 0.5 #set the game to half speed for dramatic effect
	body.get_node("CollisionShape2D").queue_free()
	#queue_free is to delete something
	#body is our player since they are the only thing that collides with this kill zone
	#we use get_node to search for a node with this name on the referenced 'scene'/body
	timer.start()
	


func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
