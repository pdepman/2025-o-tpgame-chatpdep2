import src.item.item.Item
class BoxItem inherits Item{
    override method image() = "cardboardBox.png"

    override method usar(character) {

        character.equiparItem(self)
        game.removeVisual(self)
    }
}


//area 1
const box1=new BoxItem(position=game.at(14,3), name="box1")