import src.characters.*
import src.levels.level01.*

/*
 * Manejador de colisiones mejorado
 * Trabaja con objetos pre-instanciados del pool
 * Se instancian todas las colisiones al inicio del juego para minimizar lag
 */
object colissionHandler {
    const collidableObjects = []

    method initialize() {
        console.println("CollisionHandler inicializado")
    }

    method register(obj) {
        if (obj == null || collidableObjects.contains(obj)) { return }
        if (obj.esColisionable()) {
            collidableObjects.add(obj)
            game.whenCollideDo(obj, { other => other.collidedBy(obj) })
            console.println("Registrado: " + obj.className() + " en " + obj.position())
        }
        return
    }

    method unregister(obj) {
        if (collidableObjects.contains(obj)) { collidableObjects.remove(obj) }
    }

    method unregisterAll() {
        collidableObjects.forEach { obj => obj.canBeCollided(false) }
        collidableObjects.clear()
        console.println("Todas las colisiones limpiadas")
    }

    method hasColissionAt(pos) = game.getObjectsIn(pos).any { obj => obj.esColisionable() }
    method getCollidableObjects() = collidableObjects

}