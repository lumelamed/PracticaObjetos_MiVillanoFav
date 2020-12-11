import Armas.*

class Minion {
	var tipoDeMinion = minionAmarillo
	var property cantidadDeBananas = 10
	var property armas = #{}
	
	method esPeligroso(){
		return tipoDeMinion.esPeligroso(armas.size())
	}
	
	method ingerirSueroMutante(){
		tipoDeMinion.ingerirSueroMutante(self)
	}
	
	method transformarseEn(nuevoTipoDeMinion){
		tipoDeMinion = nuevoTipoDeMinion
	}
	
	method perderTodasLasArmas() {
		armas = #{}
	}
	
	method restarBananas(cantidad) {
		cantidadDeBananas -= cantidad
	}
	
	method armaMasPotente(){
		return armas.max { arma => arma.potencia() }
	}
	
	method nivelDeConcentracion(){
		return tipoDeMinion.nivelDeConcentracion(self.armaMasPotente(), cantidadDeBananas)
	}
	
	method agregarArma(nuevaArma){
		armas.add(nuevaArma)
	}
	
	method alimentarse(cantBananas){
		cantidadDeBananas += cantBananas
	}
}

object minionAmarillo {
	
	method esPeligroso(cantArmas){
		return cantArmas > 2
	}
	
	method ingerirSueroMutante(minion){
		minion.perderTodasLasArmas()
		minion.restarBananas(1)
		minion.transformarseEn(minionVioleta)
	}
	
	method nivelDeConcentracion(armaMasPotente, cantBananas){
		return armaMasPotente.potencia() + cantBananas
	}
}

object minionVioleta {
	
	method esPeligroso(cantArmas){
		return true
	}
	
	method ingerirSueroMutante(minion){
		minion.restarBananas(1)
		minion.transformarseEn(minionAmarillo)
	}
	
	method nivelDeConcentracion(armaMasPotente, cantBananas){
		return cantBananas
	}
}