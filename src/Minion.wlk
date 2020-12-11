import Armas.*

class Minion {
	var tipoDeMinion = minionAmarillo
	var property cantidadDeBananas = 10
	var property armas = #{}
	var property cantidadDeMaldadesHechas = 0
	
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
	
	method tieneArma(unArma){
		return armas.contains(unArma)
	}
	
	method tieneAlgunRayoCongelante(){
		return armas.any { arma => arma.esUnRayoCongelante() }
	}
	
	method tieneAlgunRayoEncogedor(){
		return armas.any { arma => arma.esUnRayoEncogedor() }
	}
	
	method hacerUnaMaldad() {
		cantidadDeMaldadesHechas ++
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