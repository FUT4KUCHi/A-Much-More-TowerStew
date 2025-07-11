class_name SushiTable extends Node3D

@onready var snap_point: Marker3D = $Visual/SnapPoint
@onready var animation_player = $AnimationPlayer
@onready var progress_bar = $ProgressBar
@onready var timer = $Timer

@export var resource: ItemResource

var has_item: bool

var ingredient_check: bool = false
var required_ingredients: Array[String]
var ingredient_satisfied: bool = false
var is_rolling: bool = false

var current_ingredients: Array[String] = []

func _ready():
	add_to_group("SnappingPoints")
	add_to_group("Interactable")
	add_to_group("SushiTable")
	
	required_ingredients = resource.required_ingredients

func add_item(item_id: String):
	# Reject item if it's not part of the recipe
	if item_id not in required_ingredients:
		print("Rejected: %s is not part of the recipe." % item_id)
		return
		
	# Reject if it's already added (avoid duplicates)
	if item_id in current_ingredients:
		print("Duplicate: %s already added." % item_id)
		return
		
	## Don't accept ingredients if not in checking mode
	#if not ingredient_check:
		#return
		
	# Ensure resource is loaded
	if resource == null:
		push_warning("SushiTable: resource is null.")
		return
		
	# Add valid ingredient
	current_ingredients.append(item_id)
	print("Added:", item_id)

	check_ingredients()


func check_ingredients() -> void:
	if resource == null:
		push_warning("SushiTable: resource is null, cannot check ingredients.")
		return
		
	var required = resource.required_ingredients
	current_ingredients.sort()
	required.sort()
	
	if current_ingredients == required:
			ingredient_satisfied = true
			$ProgressBar.visible = true
			animation_player.play("sushi_rolling")
			is_rolling = true
			timer.start(10.0)

func on_interact() -> String:
	if has_item:
		return resource.id
	else:
		return ""

func remove_item():
	has_item = false
	is_rolling = false
	for child in get_children():
		if child.is_in_group("Item"):
			child.queue_free()

func _on_timer_timeout():
	$ProgressBar.visible = false
	var dish = resource
	var instance = resource.scene.instantiate()
	add_child(instance)
	instance.global_transform.origin = snap_point.global_transform.origin
	if dish.can_be_processed:
		#var dish_id = Global.get_ingredient_data(stored_item_id).processed_item_id
		#stored_item_id = dish_id
		is_rolling = false
		has_item = true
