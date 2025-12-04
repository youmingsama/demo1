extends Area2D

var vec_x:float=1.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if vec_x<0:
		scale.x=-1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x+=vec_x*1
	pass
