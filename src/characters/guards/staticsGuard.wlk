import wollok.game.* // Es necesario importar wollok.game.* cuando defino una clase?

import src.characters.guards.guards.Guard


class StaticGuard inherits Guard {
    method image()="static_guard.png"
    
    // Comportamiento específico para guardias estáticos
    override method comportamiento() {
        // Los guardias estáticos no se mueven, solo vigilan su área
        // Podríamos agregar lógica para que giren la cabeza o cambien de dirección ocasionalmente
    }
    override method verificarDeteccion() {
        // Lógica para detectar al jugador en un área fija
    }

    override method actualizarEstado() {

    }
}
