import Minion.*
import Armas.*

class Villano {
	var property minions = #{}
	
	method nuevoMinion(){
		minions.add(new Minion(tipoDeMinion = minionAmarillo, cantidadDeBananas = 5, armas = new RayoCongelante(potencia = 10)))
	}
	
	method otorgarArma(unArma, unMinion){
		unMinion.agregarArma(unArma)
	}
	
	method alimentar(cantBananas, unMinion){
		unMinion.alimentarse(cantBananas)
	}
}
