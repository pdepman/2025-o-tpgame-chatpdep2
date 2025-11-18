import src.characters.snake.snake.solidSnake
import src.system.colissions.*
import wollok.game.*
import src.gameObject.GameObject


class Bullet inherits GameObject{
    var gunOwner = null // TODO: o por defecto snake, o crear objeto emptyGun
    var active = false
    method image() = gunOwner.lastMovement() + "_bullets.gif"

    method fire(character, isVisible){
        if (!active){
            gunOwner = character
            active = true            
            canBeCollided = true
            colissionHandler.register(self)
            position = gunOwner.position()
            if(isVisible){
                game.addVisual(self)
            }
            self.move()
        }
    }

    method stop() {
        canBeCollided = false
        game.removeVisual(self)
        colissionHandler.unregister(self)
        active = false
    }

    method move(){

    }

    override method collidedBy(character){
        character.takeDamage(50)
    }
}

object bulletManager{
/*     const matchDirection = new Dictionary()
    method init() {
        matchDirection.put("right", { pos => game.at(pos.x()+1, pos.y()) })
        matchDirection.put("left", { pos => game.at(pos.x()-1, pos.y()) })
        matchDirection.put("up", { pos => game.at(pos.x(), pos.y()+1) })
        matchDirection.put("down", { pos => game.at(pos.x(), pos.y()-1) })      
    } */

    method takeBullets() = [
        new Bullet(position = game.origin()),
        new Bullet(position = game.origin()),
        new Bullet(position = game.origin())
    ]

    method fire(character, bullets) {
        var isVisible = true
        bullets.first().fire(character, isVisible) //La primer bala es inmediata
        bullets.drop(1).forEach({ bullet =>      
            game.schedule(300, { bullet.fire(character, isVisible) })            
        })        
    }
}