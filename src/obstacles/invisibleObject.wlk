import wollok.game.*
import src.gameObject.GameObject


class Invisible inherits GameObject{
    override method image()=null
    override method update()=null
    override method esColisionable() = true

    method collidedForGuard(guard) { 
        // TODO: Cuando los guardias patrullen, acá va la lógica
        // se envía mensaje al guardia que chocó contra un objeto
 }
}
