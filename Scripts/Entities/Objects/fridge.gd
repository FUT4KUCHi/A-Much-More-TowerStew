class_name Fridge extends Node3D

func _ready():
	add_to_group("Interactable")
	add_to_group("Fridge")


func on_interact():
	var ingredient_keys = Global.ingredient_registry.keys()
	var item: ItemResource = Global.ingredient_registry[ingredient_keys[randi() % ingredient_keys.size()]]
	return item.id

#func on_interact():
	#var item: ItemResource = Global.get_ingredient_data("egg")
	#return item.id
