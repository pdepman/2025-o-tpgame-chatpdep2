import wollok.game.* // Es necesario importar wollok.game.* cuando defino una clase?

import src.characters.guards.guards.Guard

class PatrollGuard inherits Guard {
    method image()="patroll_guard.png"

    override method comportamiento() {
        // Lógica para patrullar un área específica
        // Podríamos definir un camino predefinido o un patrón de movimiento
    }

    override method verificarDeteccion() {
        // Lógica para detectar al jugador en un área fija
    }

    override method actualizarEstado() {

    }
}
