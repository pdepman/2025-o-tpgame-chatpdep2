import src.characters.guards.patrollGuard.*
import src.characters.guards.staticsGuard.*
import src.characters.snake.*
import src.levels.level01.*

object colissionHandler {
    method initialize() {
    // Por ahora, el comportamiento ante una colisión es el mismo, sin importar el tipo de guardia
    area01.guards().forEach{
        guard => game.whenCollideDo(guard, { gameObject => gameObject.collidedForStaticGuard() } )}
    }
}