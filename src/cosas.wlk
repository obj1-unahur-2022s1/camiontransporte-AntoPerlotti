object knightRider {
	
	method peso(){
		return 500
	}
	
	method nivelPeligrosidad(){
		return 10
	}
}

object bumblebee {
	var esAuto= true
	
	method cambiarDeAutoARobot(valor){
		esAuto= valor
	}
	
	method peso(){
		return 800
	}
	
	method nivelPeligrosidad(){
		if(esAuto){
			return 15
		} else {
			return 30
		}
	}
}

object paqueteLadrillos{
	var property cantidadDeLadrillos =0
	
	method peso(){
		return 2 * self.cantidadDeLadrillos()
	}
	
	method nivelPeligrosidad(){
		return 2
	}
}


object arena {
	var property peso = 0
	
	method nivelPeligrosidad(){
		return 1
	}
}

object bateriaAntiaerea {
	var estaConMisiles= true
	
	method cambiarEstadoDeCarga(valor){
		estaConMisiles= valor
	}
	
	method peso(){
		if(estaConMisiles){
			return 300
		} else {
			return 200
		}
	}
	
	method nivelPeligrosidad(){
		if(estaConMisiles){
			return 100
		} else {
			return 0
		}
	}
}

object contenedor {
	var cosasDentro=[]
	
	method agregarCosa(objeto){
		cosasDentro.add(objeto)
	}
	
	method peso(){
		return 100 + cosasDentro.sum({x=>x.peso()})
	}
	
	method nivelPeligrosidad(){
		if(not cosasDentro.isEmpty()){
			return cosasDentro.max({x=> x.nivelPeligrosidad()}).nivelPeligrosidad()
		} else {
			return 0
		} 
	}
}

object residuosRadioactivos {
	var property peso= 0
	
	method nivelPeligrosidad(){
		return 200
	}
}

object embalajeSeguridad {
	var objetoInterior
	
	method envuelveA(cosa){
		objetoInterior=cosa
	}
	
	method peso(){
		return objetoInterior.peso()
	}
	
	method nivelPeligrosidad(){
		return objetoInterior.nivelPeligrosidad() * 0.5
	}
}




