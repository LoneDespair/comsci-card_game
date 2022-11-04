extends Node

onready var progress_bar := $"../progress"
onready var count_label := $"../count"

var remaining_time : float = 0.0

export var wait_time : float = 20.0

signal timeout


func _ready() -> void:
	set_process(false)


func start(new_wait_time := wait_time) -> void:
	wait_time = new_wait_time
	remaining_time = new_wait_time
	progress_bar.max_value = new_wait_time
	set_process(true)


func stop() -> void:
	set_process(false)


func _process(delta: float) -> void:
	remaining_time -= delta
	progress_bar.value = remaining_time
	count_label.text = str(ceil(remaining_time))
	
	if remaining_time <= 0:
		emit_signal("timeout")
		stop()
