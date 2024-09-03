object pepe {
	
    var categoria = cadete

    var resultados = porcentaje

    var presentismo = normal

    var faltas = 0

    method categoria(_categoria) {
        categoria = _categoria
    }

    method resultados(_resultados) {
        resultados = _resultados
    }

    method presentismo(_presentismo) {
        presentismo = _presentismo
    }

    method faltas(_faltas) {
        faltas = _faltas
    }

    method faltas() {
        return faltas
    }

    method sueldo() {
        return self.neto() +
               self.bonoResultados() +
               self.bonoPresentismo()
    }

    method neto() {
        return categoria.neto()
    }

    method bonoResultados() {
        return resultados.valor(self)
    }

    method bonoPresentismo() {
        return presentismo.valor(self)
    }

}

object sofia {

    var categoria = cadete

    var resultados = porcentaje

    method categoria(_categoria) {
        categoria = _categoria
    }

    method resultados(_resultados) {
        resultados = _resultados
    }

    method sueldo() {
        return self.neto() +
               self.bonoResultados()
    }

    method neto() {
        return categoria.neto() * 1.3
    }

    method bonoResultados() {
        return resultados.valor(self)
    }
}


//Categorias
object cadete {

    var valor = 20000

    method neto() {
        return valor
    }

    method valor(_valor) {
        valor = _valor
    }

    method valor() {
        return valor
    }
}

object gerente {

    var valor = 15000

    method neto() {
        return valor
    }

    method valor(_valor) {
        valor = _valor
    }

    method valor() {
        return valor
    }
}

object vendedor {

    var valor = 16000

    var aumentoPorMuchasVentas = 1

    method valor(_valor) {
        valor = _valor
    }

    method valor() {
        return valor
    }

    method aumentoPorMuchasVentas() {
        return aumentoPorMuchasVentas
    }

    method activarAumentoPorMuchasVentas() {
        aumentoPorMuchasVentas = 1.25
    }

    method desactivarAumentoPorMuchasVentas() {
        aumentoPorMuchasVentas = 1
    }

    method neto() {
        return valor * (self.aumentoPorMuchasVentas())
    }
}

object medioTiempo {
    
    method categoriaBase(categoria) {
        categoria.valor(categoria.valor() / 2)
    }
}

//Resultados
object porcentaje {
    method valor(empleado) {
        return (empleado.neto() * 0.1)
    }
}

object fijo {
    method valor(empleado) {
        return 800
    }
}

object nulo { // Me sirve tambien para el de presentismo
    method valor(empleado) {
        return 0
    }
}


//Presentismo

object normal {
    method valor(empleado) {
        return (2000 - (empleado.faltas() * 1000)).max(0)
    }
}

object ajuste {
    method valor(empleado) {
        return (100 - (empleado.faltas() * 100)).max(0)
    }
}

object demagogico {
    method valor(empleado) {
        return if (empleado.neto() < 18000) 500
        else 300
    }
}