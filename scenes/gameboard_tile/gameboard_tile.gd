extends Node2D
class_name GameboardTile

@onready var sprite := $Sprite
@onready var pawn_slots : Array[Marker2D] = [$PawnSlotA, $PawnSlotB]
