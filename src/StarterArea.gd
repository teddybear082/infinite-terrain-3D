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

# Called when the node enters the scene tree for the first time.
func _ready():
	assign_words($PickableWord1/WordMesh.mesh.text)
	assign_words($PickableWord2/WordMesh.mesh.text)
	assign_words($PickableWord3/WordMesh.mesh.text)
	assign_words($PickableWord4/WordMesh.mesh.text)
	assign_words($PickableWord5/WordMesh.mesh.text)
	assign_words($PickableWord6/WordMesh.mesh.text)
	
	
	$PickableWord1.visible = false
	$PickableWord2.visible = false
	$PickableWord3.visible = false
	$PickableWord4.visible = false
	$PickableWord5.visible = false
	$PickableWord6.visible = false
	
	yield(get_tree().create_timer(8),"timeout")
	
	$OQ_SplashScreen.queue_free()
	
	yield(get_tree().create_timer(40),"timeout")
	
	$PickableWord1.visible = true
	$PickableWord2.visible = true
	$PickableWord3.visible = true
	$PickableWord4.visible = true
	$PickableWord5.visible = true
	$PickableWord6.visible = true
	
	yield(get_tree().create_timer(24),"timeout") # Replace with function body.
	$SphereInstance.queue_free()
	$InvisibleWall.queue_free()
	$InvisibleWall2.queue_free()
	$InvisibleWall3.queue_free()
	$InvisibleWall4.queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func assign_words(pickable_wordmesh_text):
	var word_selection = null
	var random = RandomNumberGenerator.new()
	random.randomize()
	word_selection = random.randi() % inspirational_words.size()
	print(str(word_selection))
	pickable_wordmesh_text = inspirational_words[word_selection]
	print(str(pickable_wordmesh_text))
	inspirational_words.remove(word_selection)
	
