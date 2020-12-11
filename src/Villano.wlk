import Minion.*
import Armas.*
import Ciudad.*

class Villano {
	var property minions = #{}
	const ciudadEnQueVive // supongo constante
	
	method nuevoMinion(){
		minions.add(new Minion(tipoDeMinion = minionAmarillo, cantidadDeBananas = 5, armas = new RayoCongelante(potencia = 10)))
	}
	
	method otorgarArma(unArma, unMinion){
		unMinion.agregarArma(unArma)
	}
	
	method alimentar(cantBananas, unMinion){
		unMinion.alimentarse(cantBananas)
	}
	
	method realizarMaldad(unaMaldad){
		const minionsAsignados = unaMaldad.minionsAptos(minions)
		if(minionsAsignados.isEmpty()){
			throw new Exception(message = "Este villano no posee minions aptos para realizar la maldad")
		}
		unaMaldad.realizarse(minionsAsignados)
	}
	
	//ejemplo: realizarMaldad(new Robo(objetivo = luna))
}

//Maldades

class Congelar {
	var nivelDeConcentracionRequerido = 500 //puede variar en cada nuevo objeto de la clase Congelar
	
	method minionsAptos(listaDeMinions){
		return listaDeMinions.filter { minion => minion.tieneAlgunRayoCongelante() && minion.nivelDeConcentracion() >=  nivelDeConcentracionRequerido }
	}
	
	method realizarse(minionsAsignados) {
		ciudad.disminuirTemperatura(30)
		minionsAsignados.forEach { minion => minion.alimentarse(10) }
	}
}

class Robo {
	const property objetivo // cada objeto de la clase robo tendra un objetivo
		
	method minionsAptos(listaDeMinions){
		return listaDeMinions.filter { minion => minion.esPeligroso() && minion.nivelDeConcentracion() >=  objetivo.nivelDeConcentracionRequerido() && objetivo.cumpleSusRequisitos(minion)}
	}
	
	method realizarse(minionsAsignados){
		objetivo.realizarRobo(minionsAsignados)
		ciudad.eliminarObjetoRobado(objetivo)
	}
}