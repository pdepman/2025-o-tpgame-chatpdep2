// Estructura base para todos los objetos del juego (No incluye personajes)
class GameObject {
    var property position
    var canBeCollided = false 
    
    method image() // Abstract - implementar en subclases
    method update() { } // TODO: Implementar
    method esColisionable() = false

    method canBeCollided(valor) {
        canBeCollided = valor
    }
}