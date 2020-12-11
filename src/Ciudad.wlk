import Armas.*

object ciudad {
	var temperatura = 20
	var objetos = [piramide1, sueroMutante, luna, sueroMutante] //los defini yo
	
	method disminuirTemperatura(grados){
		temperatura -= grados
	}
	
	method eliminarObjetoRobado(objetoRobado){
		objetos.remove(objetoRobado)
	}
	
}


//objetos que pueden ser robados

class Piramide { 
	var altura
	
	method nivelDeConcentracionRequerido(){
		return altura / 2
	}
	
	method realizarRobo(minionsAsignados){
		minionsAsignados.forEach { minion => minion.alimentarse(10) }
	}
	
	method cumpleSusRequisitos(unMinion){
		return true
	}
}

const piramide1 = new Piramide(altura = 10)
const piramide2 = new Piramide(altura = 4)


object sueroMutante {
	
	method nivelDeConcentracionRequerido(){
		return 23
	}
	
	method cumpleSusRequisitos(unMinion){
		return unMinion.cantidadDeBananas() >= 100
	}
	
	method realizarRobo(minionsAsignados){
		minionsAsignados.forEach { minion => minion.ingerirSueroMutante() }
	}
}

object luna {
	
	method nivelDeConcentracionRequerido(){
		return 0 // segun la definicion del nivel de concentracion, nunca sera < 0
	}
	
	method cumpleSusRequisitos(unMinion){
		return unMinion.tieneAlgunRayoCongelante()
	}
	
	method realizarRobo(minionsAsignados){
		minionsAsignados.forEach { minion => minion.agregarArma(new RayoEncogedor(potencia = 10)) }
	}
}