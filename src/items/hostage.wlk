import src.gameObject.GameObject
import src.gameManager.*
import src.items.pickables.Pickable

class Hostage inherits GameObject{
    override method isPickable() = true // para utilizar polimorfismo con character
    method equip(character){
        gameManager.winner(character)
    }
}