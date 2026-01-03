extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D  #Ruta al AnimatedSprite2D

func _ready():
	animated_sprite.play("idle_down")  # Reproduce idle en loop infinito

func _physics_process(delta):
	pass  # Mantiene posición fija

#Crear zona para que siga al personaje
