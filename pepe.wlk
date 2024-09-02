object pepe {
	
    var sueldo = 0

    var categoria = "cadete"

    var resultados = "porcentaje"

    var presentismo = "normal"

    var diasTrabajo = 0

    var diasTrabajados = 0

    method diasTrabajo() {
        return diasTrabajo
    }

    method diasTrabajo(_diasTrabajo) {
        diasTrabajo = _diasTrabajo
    }

    method diasTrabajados() {
        return diasTrabajados
    }

    method diasTrabajados(_diasTrabajados) {
        diasTrabajados = _diasTrabajados
    }

    method categoria() {
        return categoria
    }

    method categoria(_categoria) {
        categoria = _categoria
    }

    method sueldo() {
        sueldo = self.neto() +
        (self.bonoXResultados()) +
        (self.bonoXPresentismo())
    }

    method valorCategoria() {
        return if (self.categoria() == "cadete") 20000 
        else (15000)
    }

    method neto() {
        return self.valorCategoria()
    }

    method resultados() {
        return resultados
    } 

    method resultados(_resultados) {
        resultados = _resultados
    }

    method bonoXResultados() {
        return if (self.resultados() == "porcentaje") (1000 / self.neto())
        else if (self.resultados() == "montoFijo") (800)
        else 0
    }

    method presentismo() {
        return presentismo
    }

    method presentismo(_presentismo) {
        presentismo = _presentismo
    }

    method calcNormal() {
        return if (self.diasTrabajo() == self.diasTrabajados()) (2000)
          else if ((self.diasTrabajo() - 1) == self.diasTrabajados()) (1000)
          else 0
    }

    method calcAjuste() {
        return if (self.diasTrabajo() == self.diasTrabajados()) (100)
        else 0
    }

    method calcDemagogico() {
        return if (self.neto() < 18000) (500)
        else 300
    }

    method bonoXPresentismo() {
        return if (self.presentismo() == "normal") (self.calcNormal())
          else if (self.presentismo() == "ajuste") (self.calcAjuste())
          else if (self.presentismo() == "demagogico") (self.calcDemagogico())
          else 0

    }
}
