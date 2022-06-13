extends Spatial

var currentPosition;
var movePosition;
var targetPosition;
export var distance =  1.5;
export var time_to_move = 0.5;
export var overlay_move_speed = 3
export (NodePath) var arvrcamera_path = null
var vrCamera = null

# Called when the node enters the scene tree for the first time.
func _ready():
	vrCamera = get_node(arvrcamera_path)
	var viewDir = -vrCamera.global_transform.basis.z;
	var camPos = vrCamera.global_transform.origin;
	currentPosition = camPos + viewDir * distance;
	targetPosition = currentPosition;
	movePosition = currentPosition;
	
	look_at_from_position(currentPosition, camPos, Vector3(0,1,0));
	
	
	pass # Replace with function body.

var moving = false;
var moveTimer = 0.0;

func _process(dt):
	var viewDir = -vrCamera.global_transform.basis.z;
	viewDir.y = 0;
	viewDir = viewDir.normalized();
	
	var camPos = vrCamera.global_transform.origin;

	#TODO: rotate instead of move
	targetPosition = camPos + viewDir * distance;
#	var distToTarget = (targetPosition - currentPosition).length();
#	if moving:
#		currentPosition = currentPosition + (movePosition - currentPosition) * holster_move_speed * dt;
#		if (distToTarget < 0.05):
#			moving = false;
	currentPosition = targetPosition #trying this to make move instantaneous
			
#	if (distToTarget > 0.5):
#		moveTimer += dt;
#	else:
#		moveTimer = 0.0;
			
#	if (moveTimer > time_to_move):
#		moving = true;
#		movePosition = targetPosition;

	look_at_from_position(currentPosition, camPos, Vector3(0,1,0));

	
