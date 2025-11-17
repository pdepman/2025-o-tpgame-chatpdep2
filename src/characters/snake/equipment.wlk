import src.characters.snake.snake.solidSnake
import src.utils.log.log
import src.system.colissions.colissionHandler
import src.items.pickables.*
object snakeEquipment {
    const allEquipment = []
    var itemInUse = emptyHands

    method allEquipment() = allEquipment
    method itemInUse() = itemInUse 

    method pickUpItem(item) {
        allEquipment.add(item)
        itemInUse = item
    }

    method giveUpItem(character) {
        if (itemInUse != null) {
            itemInUse.drop(character)
        }
        self.removeItemFromEquipment(itemInUse)
    }

    method useItem(character) {
        if (itemInUse != emptyHands) {
            log.info(self, "Snake usa: " + itemInUse.displayImage())
            itemInUse.beUse(character)
        } else {
            log.info(self, "No tiene ningún objeto para usar.")
        }
    }

    method removeItemFromEquipment(item){
        // las verificaciones las hace el caller
        itemInUse = emptyHands
        if (allEquipment != [] && allEquipment.contains(item)){
            allEquipment.remove(item)
        }
    }

    method hasItemToWin() = allEquipment.any({ item => item.checkWin()})
}