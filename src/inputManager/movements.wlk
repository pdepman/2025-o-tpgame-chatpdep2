import src.system.gameStatus.gameCurrentStatus
import wollok.game.*
import src.system.colissions.colissionHandler


/*
 * Definición base para todos los movimientos de todos los elementos "movibles".
*/
object movement {
    method moveUp(gameObject) {
        gameObject.lastMovement("up")
        gameObject.moveTo(gameObject.position().up(1))
    }

    method moveDown(gameObject) {
        gameObject.lastMovement("down")
        gameObject.moveTo(gameObject.position().down(1))
    }

    method moveLeft(gameObject) {
        gameObject.lastMovement("left")
        gameObject.moveTo(gameObject.position().left(1))
    }

    method moveRight(gameObject) {
        gameObject.lastMovement("right")
        gameObject.moveTo(gameObject.position().right(1))
    }

    method canMove(pos) {
        return pos.x() >= 0 && pos.x() < game.width() && 
        pos.y() >= 0 && pos.y() < game.height() &&
        !gameCurrentStatus.isBlocked(pos)
  }
}