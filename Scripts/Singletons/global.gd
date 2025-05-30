class_name GlobalRegistry extends Node

var debug

var dishes_registry: Dictionary = {}
var customer_registry: Dictionary = {}
var ingredient_registry: Dictionary = {}
var item_registry: Dictionary = {}

func _register_items():
	item_registry["meat"] = preload("res://Custom Resources/Ingredients/Meat.tres")
	item_registry["bowl"] = preload("res://Custom Resources/Ingredients/Bowl.tres")
	item_registry["sausage"] = preload("res://Custom Resources/Ingredients/Sausage.tres")
	item_registry["egg"] = preload("res://Custom Resources/Ingredients/Egg.tres")
	item_registry["rice-ball"] = preload("res://Custom Resources/Ingredients/RiceBall.tres")
	
	item_registry["soup"] = preload("res://Custom Resources/Food/Soup.tres")
	item_registry["steak"] = preload("res://Custom Resources/Food/Steak.tres")
	item_registry["sauerkraut"] = preload("res://Custom Resources/Food/Sauerkraut.tres")
	item_registry["sushi-egg"] = preload("res://Custom Resources/Food/SushiEgg.tres")
	item_registry["fried_egg"] = preload("res://Custom Resources/Food/FriedEgg.tres")
	item_registry["chow_mein"] = preload("res://Custom Resources/Food/ChowMein.tres")

func get_item_data(id: String) -> ItemResource:
	return item_registry.get(id)

func _register_customers():
	customer_registry["emily"] = preload("res://Custom Resources/Customers/Emily.tres")
	customer_registry["austin"] = preload("res://Custom Resources/Customers/Austin.tres")
	customer_registry["tammy"] = preload("res://Custom Resources/Customers/Tammy.tres")
	customer_registry["sam"] = preload("res://Custom Resources/Customers/Sam.tres")

func _register_ingredients():
	ingredient_registry["meat"] = preload("res://Custom Resources/Ingredients/Meat.tres")
	ingredient_registry["bowl"] = preload("res://Custom Resources/Ingredients/Bowl.tres")
	ingredient_registry["sausage"] = preload("res://Custom Resources/Ingredients/Sausage.tres")
	ingredient_registry["egg"] = preload("res://Custom Resources/Ingredients/Egg.tres")
	ingredient_registry["rice-ball"] = preload("res://Custom Resources/Ingredients/RiceBall.tres")

func _register_dishes():
	dishes_registry["soup"] = preload("res://Custom Resources/Food/Soup.tres")
	dishes_registry["steak"] = preload("res://Custom Resources/Food/Steak.tres")
	dishes_registry["sauerkraut"] = preload("res://Custom Resources/Food/Sauerkraut.tres")
	dishes_registry["sushi-egg"] = preload("res://Custom Resources/Food/SushiEgg.tres")
	dishes_registry["fried_egg"] = preload("res://Custom Resources/Food/FriedEgg.tres")
	dishes_registry["chow_mein"] = preload("res://Custom Resources/Food/ChowMein.tres")

func get_dish_data(id: String) -> ItemResource:
	return dishes_registry.get(id)

func get_ingredient_data(id: String) -> ItemResource:
	return ingredient_registry.get(id)

func get_customer_data(id: String) -> CustomerResource:
	return customer_registry.get(id)
