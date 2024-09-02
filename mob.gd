extends CharacterBody2D

var health = 2

@onready var player = get_node('/root/Game/Player')
@onready var score_label = player.get_node("Score")

func _ready():
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()

func take_damage():
	health -= 1
	%Slime.play_hurt()
	
	# Mobs die
	if health == 0:
		queue_free()
		
		# Increment the score when mob is defeated
		score_label.score += 10
	
	# Play smoke explosions
	const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
	var smoke = SMOKE_SCENE.instantiate()
	get_parent().add_child(smoke)
	smoke.global_position = global_position
