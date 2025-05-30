class_name Level
extends Node

@export var customer: PackedScene

@onready var timer = $SubViewportContainer/SubViewport/Main/Timer


func _ready():
	Global._register_dishes()
	Global._register_customers()
	Global._register_ingredients()
	Global._register_items()
	_spawn_customer()

# Also assigns random attributes, commented out.
func _spawn_customer():
	$Debug.customer_variable += 1
	var customer_instance: CharacterBody3D = customer.instantiate()
	if customer_instance:
		$SubViewportContainer/SubViewport/Main.add_child(customer_instance)
		customer_instance.set_state(customer_instance.State.FIND_CHAIR)
		customer_instance.global_transform.origin = find_child("Door").global_transform.origin
		timer.start(10.0)
	else:
		return

func _on_timer_timeout():
	_spawn_customer()

func point_increase():
	$SubViewportContainer/SubViewport/Main/Player.points += 50
	%Points.text = "Profits: " + str($SubViewportContainer/SubViewport/Main/Player.points)

func point_decrease():
	$SubViewportContainer/SubViewport/Main/Player.points -= 50
	%Points.text = "Profits: " + str($SubViewportContainer/SubViewport/Main/Player.points)
