extends DashMovement
class_name RopeDashMovement

@export var rope: Rope

const ROPE_DASH_SPEED: float = 50.0
const STARTUP_SPEED: float = 500.0

var anchor: Node2D
var rope_dir: Vector2
var dir: float = 1 #c: -1, a: 1
var dash_dir: float

func _ready() -> void:
	anchor = rope.obj1 if rope.obj2 == body_controller.body else rope.obj2 if rope.obj1 == body_controller.body else null

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("dash"):
		if not anchor: return
		
		rope_dir = body_controller.body.global_position.direction_to(anchor.global_position)
		dash_dir = (1 if rope_dir.y < 0 else -1) * Input.get_axis("left", "right")
		dashing = true
	
	if dashing:
		timer += delta
		if timer >= DASH_TIME:
			dashing = false
			timer = 0.0

func _physics_process(delta: float) -> void:
	if not dashing or not anchor: return
	
	rope_dir = body_controller.body.global_position.direction_to(anchor.global_position)
	var tangent = Vector2(-rope_dir.y, rope_dir.x)

	var counter_force: float = 0
	if body_controller.external_vel.length() < STARTUP_SPEED:
		counter_force = STARTUP_SPEED
	else:
		if dir == dash_dir:
			counter_force = 0.0
		else:
			counter_force = body_controller.external_vel.length()
	dir = dash_dir
	body_controller.external_vel += tangent * dash_dir * (counter_force + ROPE_DASH_SPEED)
