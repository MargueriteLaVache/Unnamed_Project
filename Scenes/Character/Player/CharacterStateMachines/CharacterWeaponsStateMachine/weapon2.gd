extends WeaponsState

class_name Weapon2

@export var timer : Timer
@export var next_weapon_state : Weapon3
@export var previous_weapon_state : DesertEagle
@export var bullet_2_scene : PackedScene
@export var attack_damage : float = 10
@export var speed_factor : float = 10


var wait_time : float = 0.2

func _ready():
	timer.wait_time = wait_time

func state_process(delta):
	if Input.is_action_pressed("fire") && can_fire:
		weapon_fire(get_parent().get_parent().position, player.get_global_mouse_position(), bullet_2_scene,
		attack_damage, speed_factor)
		can_fire = false
		timer.start()

func state_input(event : InputEvent):
	if event.is_action_pressed("next_weapon"):
		next_state = next_weapon_state
	if event.is_action_pressed("previous_weapon"):
		next_state = previous_weapon_state


func _on_weapon_2_cool_down_timeout():
	can_fire = true
#	print("hello2")
