object knightRider {
	
	method peso(){
		return 500
	}
	
	method nivelPeligrosidad(){
		return 10
	}
	
	method representacionDeBulto(){
		return 1
	}
	
	method consecuenciaDeCarga(){
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
	
	method representacionDeBulto(){
		return 2
	}
	
	method consecuenciaDeCarga(){
		self.cambiarDeAutoARobot(false)
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
	
	method representacionDeBulto(){
		if(self.cantidadDeLadrillos()<101){
			return 1
		} else if(self.cantidadDeLadrillos().between(101,300)){
			return 2
		} else{
			return 3
		}
	}
	
	method consecuenciaDeCarga(){
		cantidadDeLadrillos= self.cantidadDeLadrillos() + 12
	}
}


object arena {
	var property peso = 0
	
	method nivelPeligrosidad(){
		return 1
	}
	
	method representacionDeBulto(){
		return 1
	}
	
	method consecuenciaDeCarga(){
		peso= self.peso() + 20
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
	
	method representacionDeBulto(){
		if(estaConMisiles){
			return 2
		} else{
			return 1
		}
	}
	
	method consecuenciaDeCarga(){
		self.cambiarEstadoDeCarga(true)
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
	
	method representacionDeBulto(){
		return 1 + cosasDentro.sum({x=>x.representacionDeBulto()})
	}
	
	method consecuenciaDeCarga(){
		cosasDentro.forEach({x=>x.consecuenciaDeCarga()})
	}
}

object residuosRadioactivos {
	var property peso= 0
	
	method nivelPeligrosidad(){
		return 200
	}
	
	method representacionDeBulto(){
		return 1
	}
	
	method consecuenciaDeCarga(){
		peso= self.peso() + 15
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
	
	method representacionDeBulto(){
		return 2
	}
	
	method consecuenciaDeCarga(){
	}
}




