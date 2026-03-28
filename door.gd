extends Node2D

@onready var area = $Area2D
@onready var exit_point = $ExitPoint

var player_inside = false

func _ready():
	area.body_entered.connect(_on_body_entered)
	area.body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.name == "Player":
		player_inside = true

func _on_body_exited(body):
	if body.name == "Player":
		player_inside = false

func _process(delta):
	if player_inside and Input.is_action_just_pressed("ui_accept"):
		var player = get_node("../../Player")
		player.global_position = exit_point.global_position + Vector2(0, -16)
