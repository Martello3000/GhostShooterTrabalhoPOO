extends CanvasLayer

@export var classDisplay: TextureRect
@export var className: Label
@export var weaponDisplay: TextureRect
@export var weaponName: Label
@export var ammo: Label
@export var pontuacao: Label




func _process(_delta: float) -> void:
	weaponDisplay.texture = Stats.armas[Stats.arma_equipada]
	weaponName.text = Stats.arma_equipada
	
	classDisplay.texture = Stats.classes[Stats.classe_atual]
	className.text = Stats.classe_atual
	
	ammo.text = str(Stats.municao[Stats.arma_equipada])
	
	pontuacao.text = str(Stats.score)
