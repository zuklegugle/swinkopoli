extends PathFollow2D
class_name Pawn

@onready var sprite := $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "progress_ratio", 1, 1).set_trans(Tween.TRANS_LINEAR)
	print(get_parent().curve.get_point_position(0))
	#tween.connect("finished",func (): set_display_offset(Vector2(48, -56)))
	#set_display_offset(Vector2(48, -56))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func move_to_point(index):
	pass

func set_display_offset(display_offset : Vector2):
	sprite.offset = display_offset
