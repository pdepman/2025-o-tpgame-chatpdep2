import src.gameObject.GameObject
class Item inherits GameObject{
    var property name 
    method usar(character)
    override method esItem() = true
    override method esColisionable() = false
}