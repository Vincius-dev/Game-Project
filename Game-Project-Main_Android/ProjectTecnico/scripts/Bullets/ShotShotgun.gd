extends Area2D

const Velocidade = 25
const Dano = 3
const cadencia = 1.5
var direcao = 1

func _ready():
	pass

func _process(delta):
	move()
	pass

func move():
	if direcao == 1:
		position += Vector2(1,0) * Velocidade
		$Sprite.flip_h = false
	if direcao == 2:
		position += Vector2(-1,0) * Velocidade
		$Sprite.flip_h = true
	pass

func sreen_exited():
	queue_free()
	pass # Replace with function body.

func _on_ShotShotgun_body_entered(body):
	if body.is_in_group("inimigos"):
		body.DamageShotgun()
		queue_free()
	pass # Replace with function body.

func _on_Timer_timeout():
	queue_free()
	pass 
