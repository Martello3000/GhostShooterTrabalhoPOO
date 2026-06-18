extends Node

#Sinais
@warning_ignore("unused_signal")
signal alvo_over
@warning_ignore("unused_signal") #Ignora o aviso do sinal não usano nesse código
signal sequencia_over
@warning_ignore("unused_signal")
signal fase_over


var armas = ["pistola", "shotgun", "sniper"]
var arma_equipada = 0

var dano = 1
