extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var playing_stream = null

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(5),"timeout") # Replace with function body.
	play()
	playing_stream = load("res://sounds/readloud.net/Welcome.mp3")
	yield(get_tree().create_timer(8),"timeout")
	stream = playing_stream
	play()
	playing_stream = load("res://sounds/readloud.net/Explain_Your_Controls.mp3")
	yield(get_tree().create_timer(11),"timeout")
	stream = playing_stream
	play()
	playing_stream = load("res://sounds/readloud.net/Enjoy_Your_Flight.mp3")
	yield(get_tree().create_timer(48),"timeout")
	stream = playing_stream
	play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
