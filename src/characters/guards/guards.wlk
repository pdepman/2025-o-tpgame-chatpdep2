import wollok.game.* // Es necesario importar wollok.game.* cuando defino una clase?

class Guard {
    var property position
    var property direction = "down"
    var property state = "patrolling" // otro posible estado: "alert" cuando detecta al jugador
    var property detectionRange = 3 // Alcance de detección

    // Comportamiento polimórfico
    method comportamiento() {
        // Implementado en subclases
    }
    method verificarDeteccion() {
        // Lógica para detectar al jugador
    }
    method actualizarEstado() {
        // Lógica para actualizar el estado basado en detección y comportamiento
    }

    method update() {
        self.comportamiento()  
        self.verificarDeteccion()
        self.actualizarEstado()
    }
}
