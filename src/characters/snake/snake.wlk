import src.characters.snake.equipment.snakeEquipment
import src.system.objectPool.*
import src.items.pickables.*
import src.utils.log.log
import src.utils.utils.utils
import src.ui.hud.hud
import src.gameManager.gameManager
import src.characters.character.Character
import src.inputManager.movements.*
import src.system.colissions.*
import src.levels.level01.*
import src.levels.areaManager.areaManager

/*
 * Solid Snake - Personaje principal controlado por el jugador
 * Hereda de Character pero tiene comportamiento único.
 * Por ser juego tipo "one player", es un objeto singleton (WKO).
 */
object solidSnake inherits Character {
    method initialize(){
        position = game.origin()
        lastPosition = game.origin()
        movementSpeed = 1
    }
    const equipment = snakeEquipment // -> Si llegamos, agregamos que pueda cambiar entre items

    method equipment() = equipment
    override method image() = 
        "snake_" + 
        equipment.itemInUse().displayImage() + 
        "_" + 
        self.lastMovement() + ".png"

    override method onPositionChanged() {
        // Verificar si Snake debe cambiar de área
        areaManager.update(self)        
    }
    
    /*
     * Colisión con otros objetos
     */
    override method collidedBy(other){
        if (utils.getClassName(other) != null && utils.getClassName(other) == "Health"){
            self.heal(100)
            hud.recoverHearts()
            objectPool.deactivateObject(other)
        }
        if (utils.getClassName(other) != null && utils.getClassName(other) == "Hostage"){
            other.equip(self)
        }else{
            super(other)
        }
    }

    override method takeDamage(amount) {
        var damage = amount
        if (equipment.itemInUse() != emptyHands){
            damage = equipment.itemInUse().damageDecreases(self, amount)
        }
        super(damage)
        hud.lostHeart()
    }

    override method die() {
        super()
        gameManager.gameOver()
    }
    


    /*
    * Intenta agarrar un ítem (si existe alguno en esa posición)
    */
    method pickItem(){
        colissionHandler.processPickItem(self)
    }

    /*
    * Suelta el ítem actual (si tiene alguno)
    */
    method dropItem() {
        colissionHandler.processDropItem(self)
    }

    method useItem() {
        equipment.useItem(self)
    }

    method giveUpItem(){
        equipment.giveUpItem(self)
    } 

    method meetsConditionToWin() = equipment.hasItemToWin()
}