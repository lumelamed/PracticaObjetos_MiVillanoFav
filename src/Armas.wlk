class RayoCongelante {
	const nombre = "Rayo Congelante"
	const property potencia	
	
	method esUnRayoCongelante(){ //mismo caso del Parical de "El Padrino" con esSoldado()
		return true
	}
	
	method esUnRayoEncogedor(){
		return false
	}
}

class RayoEncogedor {
	const nombre = "Rayo Encogedor"
	const property potencia
	
	method esUnRayoCongelante(){
		return false
	}
	
	method esUnRayoEncogedor(){
		return true
	}
}