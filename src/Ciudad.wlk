object ciudad {
	var temperatura = 20
	
	method disminuirTemperatura(grados){
		temperatura -= grados
	}
	
}


//objetos que pueden ser robados

class Piramide { 
	var altura
	
	method nivelDeConcentracionRequerido(){
		return altura / 2
	}
}

const piramide1 = new Piramide(altura = 10)
const piramide2 = new Piramide(altura = 4)


object sueroMutante {}

object luna {}