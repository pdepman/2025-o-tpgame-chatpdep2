import src.characters.snake.snake.solidSnake
import src.system.colissions.*
import wollok.game.*
import src.gameObject.GameObject
import src.inputManager.movements.*



class Bullet inherits GameObject{
    var gunOwner = null // TODO: o por defecto snake, o crear objeto emptyGun
    var active = false
    method image() = gunOwner.lastMovement() + "_bullet.png"

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
            game.schedule(300, { self.move() })
        }
    }

    method stop() {
        canBeCollided = false
        game.removeVisual(self)
        colissionHandler.unregister(self)
        active = false
    }

    method move(){
        if(gunOwner.lastMovement() == "left") { movement.moveLeft(self) }
        if(gunOwner.lastMovement() == "right") { movement.moveRight(self) }
        if(gunOwner.lastMovement() == "up") { movement.moveUp(self) }
        if(gunOwner.lastMovement() == "down") { movement.moveDown(self) }
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