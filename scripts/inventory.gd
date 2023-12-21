extends Control
var inventory = {}
func add_to_inventory(key, label, description, count, image):
	inventory[key] = {
		"label" : label,
		"description" : description,
		"count" : count,
		"image" : image
	}
	$ItemList.add_item(inventory[key]["label"], inventory[key]["image"], false)
	
