import cosas.*

object camion {
var cosasCargadas= []
const property tara= 1000

	method cargar(cosa){
		cosasCargadas.add(cosa)
	}
	
	method descargar(cosa){
		cosasCargadas.remove(cosa)
	}
	
	method listadoDePesos(){
		return cosasCargadas.map({x =>x.peso()})
	}
	
	method todoPesoPar(){
		return self.listadoDePesos().all({x=> x.even()})
	}
	
	method hayAlgunoQuePesa(peso){
		return self.listadoDePesos().any({x=> x == peso})
	}
	
	method elDeNivel(nivel){
		return cosasCargadas.find({x=> x.nivelPeligrosidad()== nivel})
	}
	
	method pesoTotal(){
		return self.tara() + self.listadoDePesos().sum()
	}
	
	method excedidoDePeso(){
		return self.pesoTotal() > 2500
	}
	
	method objetosQueSuperanPeligrosidad(nivel){
		return cosasCargadas.filter({x=> x.nivelPeligrosidad() > nivel})
	}
	
	method objetosMasPeligrososQue(cosa){
		return cosasCargadas.filter({x=> x.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return (not self.excedidoDePeso() && cosasCargadas.all({x => x.nivelPeligrosidad()<nivelMaximoPeligrosidad}))
	}
	
	method tieneAlgoQuePesaEntre(min, max){
		return self.listadoDePesos().any({x=>x.between(min,max)})
	}
	
	method cosaMasPesada(){
		return cosasCargadas.max({x => x.peso()})
	}
	
}
