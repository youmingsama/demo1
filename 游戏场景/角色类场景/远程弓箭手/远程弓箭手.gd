extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direct:Vector2=Vector2.RIGHT
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var attack:bool=false

func _ready() -> void:
	$AnimatedSprite2D.play("移动")

func _physics_process(delta: float) -> void:
	if !is_instance_valid($LeftDownCast2.get_collider()):
		direct=Vector2.RIGHT
		$AnimatedSprite2D.flip_h=false
	elif !is_instance_valid($RightDownCast.get_collider()):
		direct=Vector2.LEFT
		$AnimatedSprite2D.flip_h=true
	if direct==Vector2.RIGHT&&attack==false:
		if is_instance_valid($RayCast2D.get_collider()):
			attack=true
			$AnimatedSprite2D.play("攻击")
			return
	if direct==Vector2.LEFT&&attack==false:
		if is_instance_valid($RayCast2D2.get_collider()):
			print("进入了")
			attack=true
			$AnimatedSprite2D.play("攻击")
			return
	if attack==true:
		return
								

	velocity=direct*SPEED
	velocity.y=gravity

	

	move_and_slide()
	




func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation=="攻击":
		attack=false
	
	




func _on_animated_sprite_2d_frame_changed() -> void:
	if $AnimatedSprite2D.animation=="攻击"and $AnimatedSprite2D.frame==10:
		if $AnimatedSprite2D.frame==10:
			if direct==Vector2.RIGHT:
				print("右边")
				var sec=preload("res://游戏场景/角色类场景/远程弓箭手/弓箭/弓箭.tscn").instantiate()
				sec.position=$R.global_position
				get_parent().add_child(sec)
			else :
				print("jinru")
				var sec=preload("res://游戏场景/角色类场景/远程弓箭手/弓箭/弓箭.tscn").instantiate()
				sec.position=$L.global_position
				get_parent().add_child(sec)
				sec.vec_x=direct.x
				
