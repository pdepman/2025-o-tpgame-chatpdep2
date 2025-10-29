import src.characters.*
import src.levels.level01.*

object colissionHandler {
    const collidableObjects = [] // Lista de objetos con colisión registrada

    method register(obj) {
        if (obj == null)
        {
            return
        }

        if (obj.esColisionable()) {
            collidableObjects.add(obj)
            game.whenCollideDo(obj, { other =>
                other.collidedForGuard(obj)
            })
            console.println("Registrado para colisión: " + obj.className() + "\n")
        }

        return
    }

    method unregisterAll() {
        collidableObjects.forEach { obj =>
            obj.canBeCollided(false)
        }
        collidableObjects.clear()
        console.println("Colisiones limpiadas.\n")
    }
    
    method hasColissionAt(pos){
        return game.getObjectsIn(pos).any(
			{ obj => obj.esColisionable() })
    } 
    
}

/*     method initialize() {
        allRegisteredAreas.forEach { area => self.registerCollisionFor(area) }
    } */

/*     method registerCollisionFor(area){
        area.guards().forEach { guard =>
            game.whenCollideDo(guard, { gameObject => gameObject.collidedForGuard(guard) })
        }
        // TODO: Agregar elementos "pickup" u otros guardias
    }

    method loadAread(area) {
        area.guards().forEach{
            guard => guard.canBeCollided(true)
        }
    }

    method destroyArea(area) {
        area.guards().forEach{
            guard => guard.canBeCollided(false)
        }
    }

    method hasColissionAt(pos){
        return game.getObjectsIn(pos).any(
			{ obj => obj.esColisionable() })
    } 
    
}
*/