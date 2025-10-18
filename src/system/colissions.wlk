import src.characters.*
import src.levels.level01.*

object colissionHandler {
    method initialize() {
        allRegisteredAreas.forEach { area => self.registerCollisionFor(area) }
    }

    method registerCollisionFor(area){
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

    method verifyColission(pos){
        return game.getObjectsIn(pos).any(
			{ obj => obj.esColisionable() })
    }

    method processInteraction(character) {
        const itemEnElPiso = game.getObjectsIn(character.position())
                                .find({ obj => obj.esItem() })
        if (itemEnElPiso != null) {
            console.println("encontre el item")
            itemEnElPiso.usar(character)
        }
    }
}