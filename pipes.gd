extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(.001,1)
	scale.x = .677


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
 

#function deletes pipes when entering area.
func _on_point_area_area_entered(area: Area2D) -> void:
	if area.name == "deletePipes":
		print("pipes entered area") 
		queue_free()
