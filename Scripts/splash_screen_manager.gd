extends Control
const MAIN_MENU = preload("res://Scenes/MainMenu.tscn")
@export var load_scene : PackedScene = MAIN_MENU
@export var in_time : float = 0.5
@export var fade_intime : float = 1.5
@export var pause_time : float = 1.5
@export var fade_out_time : float = 1.5
@export var out_time : float = 0.5
@onready var splash_screen: TextureRect = $CenterContainer/TextureRect

func _ready() -> void:
	GameManager.sounds.play_bg_music()
	fade()

func fade() -> void:
	splash_screen.modulate.a = 0.0
	var tween = self.create_tween()
	tween.tween_interval(in_time) 
	tween.tween_property(splash_screen,"modulate:a",1.0,fade_intime)
	tween.tween_interval(pause_time)
	tween.tween_property(splash_screen,"modulate:a",0.0,fade_out_time)
	tween.tween_interval(out_time)
	
	await tween.finished
	
	get_tree().change_scene_to_packed(load_scene)
