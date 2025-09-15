object tito {
    var cantidad = 0
    var bebida = cianuro
    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
        * self.inerciaBase() / self.peso()
    }
}

object whisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
    method nutrientes() = 4
}
object cianuro {
    method rendimiento(cantidad) = 0
    method nutrientes() = 0
}


object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
    method nutrientes() = 2
}

object licuado {
    const nutrientes = []
    method agregar(unIngrediente) {
        nutrientes.add(unIngrediente.nutrientes())
    }
    method rendimiento(cantidad) = nutrientes.sum() * cantidad
}

object saborizada {
    var saborizante = terere
    method saborizar(unaBebida) {
        saborizante = unaBebida
    }
    method rendimiento(cantidad) {
        return  1 + saborizante.rendimiento(cantidad/4)
}
}

object coctel {
    const ingredientes = []
    method agregar(unIngrediente) {
        ingredientes.add(unIngrediente)
    }
    method rendimiento(cantidad) {
        ingredientes.fold(1, {acumulador, i => acumulador * i.rendimiento(cantidad/ingredientes.size())})
    }

}

/*
FOLD
iteracion y procesamiento de elementos.
ejemplo:

cantDeCaracteres = mensajes.fold(0, {acumulador, i => acumulador + i.length()})
*/

object naranja {
    method nutrientes() = 10
}

object mandarina {
    method nutrientes() = 5
}

object manzana {
    method nutrientes() = 4
}

object leche {
    method nutrientes() = 7
}