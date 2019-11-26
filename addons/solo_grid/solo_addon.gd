tool

extends Node2D
enum formes {FORM_1_1, FORM_16_9, FORM_16_10, FORM_4_3 }
export (formes) var forme = 0 setget set_form
export (bool) var debug_mode = true setget set_debug 
export (Vector2) var cut = Vector2(2,2) setget set_cut
export (int) var tile_size = 64 setget set_size
export (int) var nbr_width = 16 setget set_nbr
export (Color) var color  = Color.red setget set_color
var ratio : float = 1.0

func _enter_tree() -> void:
	forme = 0
	update()
	
func set_form(value: int) -> void:
	match value:
		formes.FORM_1_1:
			ratio = 1.0
		formes.FORM_16_9:
			ratio = 1.7777777
		formes.FORM_16_10:
			ratio = 1.6666666
		formes.FORM_4_3:
			ratio = 1.3333333
	forme = value
	update()
	
func set_debug(bo:bool)-> void:
	debug_mode = bo 
	update()
	
func set_cut(vec: Vector2) -> void:
	cut = vec
	update()
	
func set_size(size: int)-> void:
	tile_size = size
	update()
	
func set_nbr(nbr: int)-> void:
	nbr_width = nbr
	update()
	
func set_color(col:Color) ->void:
	color = col
	update()
	
func _draw() -> void:
	if debug_mode :
		var w:float =  tile_size * nbr_width
		var h: float = w / ratio
	
		for x in range(cut.x +1):
			draw_line(Vector2(w * x, 0), Vector2(w * x, h * cut.y), color, 10.0)
			
		for y in range(cut.y + 1):
			draw_line(Vector2(0, h * y), Vector2(w * cut.x, h * y), color, 10.0)
