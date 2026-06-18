extends Node


#Sinais
@warning_ignore("unused_signal")
signal alvo_over
@warning_ignore("unused_signal") #Ignora o aviso do sinal não usano nesse código
signal sequencia_over
@warning_ignore("unused_signal")
signal fase_over


var classes = {
	"Arqueiro" = preload("res://assets/placeholders/archer.png"),
	"Ladino" = preload("res://assets/placeholders/rogue.png"),
	"Mago" = preload("res://assets/placeholders/shadowwizardmoneygang.png")
	
}
var classe_atual

var armas = {
	"Pistola" = preload("res://assets/placeholders/handgun-weapon-isolated-png.webp"),
	"Shotgun" = preload("res://assets/placeholders/shotgunpng.webp"),
	"Sniper" = preload("res://assets/placeholders/sniperpng.png")
}
var arma_equipada = "Pistola"

var dano = 1

var score = 0

var reloadMultiplier = 1
var damageMultiplier = 1
var switchMultiplier = 1

var municao = {
	"Pistola" = 6,
	"Shotgun" = 3,
	"Sniper" = 3
}

var municaoMax = {
	"Pistola" = 6,
	"Shotgun" = 3,
	"Sniper" = 3
}

var reloadSpeed = {
	"Pistola" = 1,
	"Shotgun" = 2.5,
	"Sniper" = 1.5
}
