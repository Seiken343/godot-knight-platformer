extends Area2D

@onready var game_manager = %GameManager
#we right clicked GameManager and chose 'Access as Unique Name' which gave it the percent sign
	#this allows us to access it as shown above from anywhere because there will always be only one unique %GameManager
@onready var animation_player = $AnimationPlayer


func _on_body_entered(body):
	#print("+1 coin!")
	game_manager.add_point()
	animation_player.play("pickup") #this line replaces queue_free. this is an animation I created
		#to hide the coin, disable its collision, play its sound effect, then queue_free after 1 second
	
	#queue_free()
	#this coin only collides with player because the player has collision layer 2 and the coin has collision mask 2
	#the layer is what layer your physics body sits on
	#the mask is what layer you collide on
	pass # Replace with function body.
