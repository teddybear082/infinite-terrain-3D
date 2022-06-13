extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$PickableWord1.visible = false
	$PickableWord2.visible = false
	$PickableWord3.visible = false
	$PickableWord4.visible = false
	yield(get_tree().create_timer(8),"timeout")
	$OQ_SplashScreen.queue_free()
	yield(get_tree().create_timer(40),"timeout")
	$PickableWord1.visible = true
	$PickableWord2.visible = true
	$PickableWord3.visible = true
	$PickableWord4.visible = true
	yield(get_tree().create_timer(50),"timeout") # Replace with function body.
	$SphereInstance.queue_free()
	$InvisibleWall.queue_free()
	$InvisibleWall2.queue_free()
	$InvisibleWall3.queue_free()
	$InvisibleWall4.queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
