extends Label

@export var float_speed : Vector2 = Vector2(0, -100)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += float_speed * delta


func _on_timer_timeout():
	queue_free()
#	print("Hello from health_changed_label.")
