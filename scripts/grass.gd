extends Node2D

var total_ducks = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var scene = load("res://scenes/duck.tscn")
	var instance = scene.instantiate()
	add_child(instance)
	total_ducks += 1
	$CanvasLayer2/Label.text = str(total_ducks)

func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()
