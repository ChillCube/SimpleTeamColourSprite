extends Sprite2D
class_name TeamColourSprite2D

@export var team : String = "Player":
	set(val):
		team = val
		_apply_colour()

var _team_colours : TeamColours
@export var team_colours : TeamColours:
	set(val):
		if _team_colours != null and _team_colours.changed.is_connected(_apply_colour):
			_team_colours.changed.disconnect(_apply_colour)
		_team_colours = val
		if val == null:
			return
		val.changed.connect(_apply_colour)
		_apply_colour()
	get:
		return _team_colours

func _apply_colour() -> void:
	if _team_colours == null:
		return
	for colour in _team_colours.colours:
		if colour.team_name == team:
			modulate = colour.colour
			return
