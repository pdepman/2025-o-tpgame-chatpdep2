import src.characters.snake.solidSnake
import wollok.game.*

/*
 * Definición base para todos los movimientos de todos los personajes.
 * idea: Tener un objeto movement que defina la dirección y la distancia
 *      recibe un character y lo mueve en la dirección indicada.
 *      Verifica colisiones con paredes y otros personajes
 *      actualiza la posición del character.
 *      Puede tener efectos de sonido asociados (pasos, etc).
 *      Verificar si el movimiento genera un cambio de área
*/
object movement {
    method moveUp(character) {
        character.moveTo(character.position().up(1))
        character.lastMovement("up")
    }

    method moveDown(character) {
        character.moveTo(character.position().down(1))
        character.lastMovement("down")
    }

    method moveLeft(character) {
        character.moveTo(character.position().left(1))
        character.lastMovement("left")
    }

    method moveRight(character) {
        character.moveTo(character.position().right(1))
        character.lastMovement("right")
    }
}