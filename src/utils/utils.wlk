/**
 * Objeto utilitario con funciones de propósito general que pueden
 * reutilizarse en distintos proyectos o juegos desarrollados en Wollok.
 *
 * Incluye métodos para:
 * - Obtener el nombre simple de una clase (`getClassName`)
 * - Iterar una colección con índice (`forEachWithIndex`)
 *
 * @author Daniel Peralta
 * @version 1.0
 */
object utils {

    /**
     * Devuelve el nombre simple de la clase (sin el paquete completo)
     * de una instancia dada.
     *
     * Ejemplo:
     * Si `instancia.className()` = "src.characters.Snake",
     * retorna "Snake".
     *
     * En caso de error o si la instancia no tiene método `className()`,
     * lanza una excepción de tipo `wollok.lang.Exception` con el mensaje
     * correspondiente.
     *
     * @param instancia Objeto del cual se quiere obtener el nombre de clase.
     * @return El nombre simple de la clase como String.
     * @throws Exception Si la instancia es nula o no tiene método `className()`.
     */
    method getClassName(instancia) {
        try {
            if (instancia == null) {
                throw new Exception(message = "Instancia nula en getClassName")
            }

            const fullName = instancia.className()
            if (fullName == null) {
                throw new Exception(message = "className() devolvió null")
            }

            const parts = fullName.split(".")
            if (parts.isEmpty()) {
                throw new Exception(message = "El nombre de clase está vacío")
            }

            return parts.last()

        } catch e : Exception {
            console.println("[utils.getClassName] Error: " + e.message())
            return "Unknown"
        }
    }


    /**
     * Ejecuta una función de bloque sobre cada elemento de una colección,
     * pasando también el índice del elemento actual.
     *
     * Ejemplo:
     * utils.forEachWithIndex(["a", "b", "c"], { elem, i =>
     *     console.println("Elemento " + i + ": " + elem)
     * })
     *
     * En caso de error durante la iteración, lanza una excepción genérica.
     *
     * @param collection Colección a recorrer (List, Set, etc.)
     * @param block Bloque de código con dos parámetros: elemento e índice.
     * @throws Exception Si ocurre un error durante la iteración.
     */
    method forEachWithIndex(aCollection, block) {
        try {
            var index = 0
            aCollection.forEach({ elem =>
                block.apply(elem, index)
                index = index + 1
            })
        } catch e : Exception {
            console.println("[utils.forEachWithIndex] Error: " + e.message())
            throw new Exception(message = "Error en forEachWithIndex: " + e.message())
        }
    }
}
