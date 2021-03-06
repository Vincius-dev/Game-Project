extends Node

var wave0 = load("res://scenes/Wave.tscn")
var base0 = load("res://scenes/Base.tscn")
var engenheiro = load("res://scenes/EngenheiroBase.tscn")
var numberWave = 1
var doorOn = true

func _ready():
	var wave1 = wave0.instance()
	add_child(wave1)
	wave1.waveNumber = numberWave
	wave1.connect("passarWave", self, "passar_wave")
	pass

func passar_wave():
	if doorOn == true:
		$Door.play()
		doorOn = false
	var base1 = base0.instance()
	base1.numberwave = numberWave
	add_child(base1)
	if $Musica.is_playing() == false:
		$Musica.play() 
	base1.connect("sairBase",self,"sair_base")
	base1.connect("TrocarTelaBase", self, "trocar_tela_engenheiro")
	pass

func trocar_tela_engenheiro():
	var engenheiro1 = engenheiro.instance()
	engenheiro1.numberwave = numberWave
	add_child(engenheiro1)
	engenheiro1.connect("SairBase",self,"sair_base")
	engenheiro1.connect("TrocarTelaBase", self, "trocar_tela_cientista")
	pass

func trocar_tela_cientista():
	passar_wave()
	pass

func sair_base():
	doorOn = true
	$Door.play()
	$Musica.stop()
	numberWave += 1
	var wave2 = wave0.instance()
	wave2.waveNumber = numberWave
	add_child(wave2)
	wave2.connect("passarWave", self, "passar_wave")
	pass

func musicgerence():
	
	pass
