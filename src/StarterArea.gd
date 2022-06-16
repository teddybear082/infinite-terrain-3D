extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var inspirational_words = [
"Believe",
"Build",
"Caring",
"Compassion",
"Conquer",
"Courage",
"Create",
"Dare",
"Dream",
"Empower",
"Faith",
"Focus",
"Forgive",
"Honesty",
"Hope",
"Humble",
"Imagine",
"Initiative",
"Inspire",
"Integrity",
"Joy",
"Kindness",
"Laugh",
"Lead",
"Limitless",
"Loving",
"Mission",
"Motivate",
"Opportunity",
"Overcome",
"Passion",
"Patience",
"Peace",
"Persevere",
"Positive",
"Pride",
"Reach",
"Remember",
"Respect",
"Rise",
"Spirit",
"Strong",
"Support",
"Teach",
"Try",
"Understanding",
"Uplift",
"Willpower",
"Wise",
"Worthy"
]
var num_words = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(8),"timeout")
	
	$OQ_SplashScreen.queue_free()
	
	assign_words(num_words)
	
	yield(get_tree().create_timer(40),"timeout")
	
	#assign_words(num_words)
		
	yield(get_tree().create_timer(24),"timeout") # Replace with function body.
	$SphereInstance.queue_free()
	$InvisibleWall.queue_free()
	$InvisibleWall2.queue_free()
	$InvisibleWall3.queue_free()
	$InvisibleWall4.queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func assign_words(num_words):
	var word_selection = null
	var pickable_wordmesh_text = null
	var random = RandomNumberGenerator.new()
	random.randomize()
	for i in num_words-1:
		var new_pickable_word = XRToolsPickable.new()
		new_pickable_word.name = str("PickableWord") + str(i)
		add_child(new_pickable_word)
		var new_mesh_instance = MeshInstance.new()
		var new_mesh_collision = CollisionShape.new()
		new_mesh_instance.cast_shadow = false
		var new_text_mesh = TextMesh.new()
		new_text_mesh.material = load("res://mat/gold_spatialmaterial.tres")
		new_text_mesh.font = load("res://fonts/PickableWordFont.tres")
		new_text_mesh.pixel_size = 0.001
		new_text_mesh.depth = .01
		word_selection = random.randi() % inspirational_words.size()
		new_text_mesh.text = inspirational_words[word_selection]
		inspirational_words.remove(word_selection)
		new_mesh_instance.mesh = new_text_mesh
		new_pickable_word.add_child(new_mesh_instance)
		new_mesh_instance.create_convex_collision()
		new_mesh_collision.shape = new_mesh_instance.get_child(0).get_child(0).shape
		new_pickable_word.add_child(new_mesh_collision)
		new_mesh_instance.get_child(0).queue_free()
		new_pickable_word.gravity_scale = 0
		new_pickable_word.reset_transform_on_pickup = false
		new_pickable_word.transform.origin = Vector3(random.randf_range(-3,3), random.randf_range(.5,1.8), random.randf_range(-1,-2))
