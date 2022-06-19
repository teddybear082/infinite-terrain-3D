extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(NodePath) var left_controller_nodepath
export(NodePath) var right_controller_nodepath
export var haptic_pulse_strength := .2
export var haptic_pulse_time := .1

var left_controller = null
var right_controller = null
# Called when the node enters the scene tree for the first time.
func _ready():
	left_controller = get_node(left_controller_nodepath)
	right_controller = get_node(right_controller_nodepath)# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func haptic_pulse(controller):
	controller.set_rumble(haptic_pulse_strength) 
	yield(get_tree().create_timer(haptic_pulse_time), "timeout") 
	controller.set_rumble(0) 



func _on_LHHapticArea_body_entered(body):
	haptic_pulse(left_controller) # Replace with function body.


func _on_LPalmHapticArea_body_entered(body):
	haptic_pulse(left_controller) # Replace with function body.


func _on_RPalmHapticArea_body_entered(body):
	haptic_pulse(right_controller) # Replace with function body.


func _on_RHHapticArea_body_entered(body):
	haptic_pulse(right_controller) # Replace with function body.
