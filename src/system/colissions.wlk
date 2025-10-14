import src.characters.guards.patrollGuard.*
import src.characters.guards.staticsGuard.*
import src.characters.snake.*
import src.levels.level01.*

object colissionHandler {
    method initialize() {
    // Por ahora, el comportamiento ante una colisión es el mismo, sin importar el tipo de guardia
    // Por ahora, el comportamiento ante una colisión es el mismo, sin importar el tipo de guardia
        area01.guards().forEach{
            guard => game.whenCollideDo(guard, { gameObject => gameObject.collidedForStaticGuard(guard) } )
        }
        area02.guards().forEach{
            guard => game.whenCollideDo(guard, { gameObject => gameObject.collidedForStaticGuard(guard) } )
        }
        area03.guards().forEach{
            guard => game.whenCollideDo(guard, { gameObject => gameObject.collidedForStaticGuard(guard) } )
        }
        area04.guards().forEach{
            guard => game.whenCollideDo(guard, { gameObject => gameObject.collidedForStaticGuard(guard) } )
        }
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
}