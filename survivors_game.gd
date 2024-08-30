extends Node2D


func _ready():
	#set_process_unhandled_input(true)
		
	# Ensure the signal is not connected multiple times
	if not %RestartButton.is_connected("pressed", Callable(self, "_on_restart_button_pressed")):
		%RestartButton.connect("pressed", Callable(self, "_on_restart_button_pressed"))


func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func _on_timer_timeout():
	spawn_mob()

func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true

func _on_restart_button_pressed():
	#print("Restart button pressed")
	## Reset game state
	#get_tree().paused = false
	#%GameOver.visible = false
	#
	## Reset player health and position
	#var player = %Player
	#player.reset_health()
	#player.global_position = Vector2(1000, 500)  # or wherever the starting position should be
#
	## Remove all mobs
	#for mob in get_tree().get_nodes_in_group("Mobs"):
		#mob.queue_free()
		#
		#
	## Restart the timer or any other necessary game elements
	#$Timer.start()
	##get_tree().reload_current_scene()
	get_tree().paused = false
	%GameOver.visible = false
	get_tree().reload_current_scene()
