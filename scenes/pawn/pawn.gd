extends PathFollow2D
class_name Pawn

@onready var sprite := $Sprite
@onready var path = get_parent() as Path2D

signal move_started
signal move_finished

var current_point_on_path_index := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	move_to_point(5)
	await(move_finished)
	move_to_point(2)

func _process(delta):
	pass

func move_to_point(idx : int, speed := 4.0):
	assert( idx > 0 and idx < path.curve.point_count, "Pawn: point index out of bounds")
	var point_diffrence := idx - current_point_on_path_index
	var tween = get_tree().create_tween()
	tween.tween_property(
		self, 
		"progress", 
		path.curve.get_closest_offset(path.curve.get_point_position(idx - 1)), 
		( abs(point_diffrence) * (1 / speed) ) 
		).set_trans(Tween.TRANS_LINEAR)
	tween.connect("finished", func f(): 
		current_point_on_path_index = idx
		print(current_point_on_path_index)
		move_finished.emit())

func set_display_offset(display_offset : Vector2):
	sprite.offset = display_offset
