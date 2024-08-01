class_name GrenadeLauncherState
extends WeaponsState

@export var timer : Timer
@export var next_weapon_state : FlameThrowerState
@export var previous_weapon_state : MachineGunState
@export var frag_grenade_scene : PackedScene
@export var attack_damage : float = 0
@export var aoe_attack_damage : float = 40
# The size of the explosion, used for ray-casting.
@export var aoe_size : float = 50.0
@export var speed_factor : float = 5
@export var reload_time : float = 1.5
@export var time_to_effect : float = 2.0
@export var nb_frags : int = 8


func _ready() -> void:
	timer.wait_time = reload_time
#	print(timer.wait_time)


func state_process(_delta) -> void:
	#print(can_fire)
	pass
	#if Input.is_action_just_pressed("fire") and can_fire:
		#weapon_fire(get_parent().get_parent().position, character.get_global_mouse_position(), bullet_3_scene,
		#attack_damage, speed_factor, aoe_attack_damage, aoe_size)
		#can_fire = false
		#timer.start()


func state_input(event : InputEvent) -> void:
	#print("Hello from state_input() in weapon3.gd.")
	if event.is_action_pressed("next_weapon"):
		next_state = next_weapon_state
	if event.is_action_pressed("previous_weapon"):
		next_state = previous_weapon_state
	# Does it work here?
	if event.is_action_pressed("fire") and can_fire:
		weapon_fire(get_parent().get_parent().position, character.get_global_mouse_position(), frag_grenade_scene,
			attack_damage, speed_factor, aoe_attack_damage, aoe_size, 0.0, 0.0, time_to_effect, nb_frags)
		can_fire = false
		timer.start()


# Called when the current_state becomes this state.
func on_enter() -> void:
	# This is so that the player can't reload a weapon that is not "equipped".
	timer.paused = false
	#print("Time left on timer in weapon3.gd: ", timer.time_left)


# Called when the next_state becomes another.
func on_exit() -> void:
	# This is so that the player can't reload a weapon that is not "equipped".
	timer.paused = true
	#print("Time left on timer in weapon3.gd: ", timer.time_left)


func _on_grenade_launcher_cool_down_timeout():
	can_fire = true
