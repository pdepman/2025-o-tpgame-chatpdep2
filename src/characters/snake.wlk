import src.system.colissions.*
import src.levels.level01.*
import src.levels.areaManager.areaManager
object solidSnake{
  var property position = game.origin()
  var property lastPosition = game.origin()
  var property lastMovement = ""

  method image()="snake_"+self.lastMovement()+".png"

  method update() { } // TODO: Implementar
  method collidedForStaticGuard(guard){
    console.println("snake colisionó un guardia...")
    if (guard.canBeCollided()){
      position = lastPosition
    }

  }

  method moveTo(nuevaPos) {
    if (self.canMove(nuevaPos)) {
      lastPosition = position
      position = nuevaPos
    }
    areaManager.update(self) // Evento para verificar si se cambia de area
  }

// con este metodo podemos cambiar de area estando parado sobre la posicion de cambio de area
  // method moveTo(nuevaPos) {
  //   var change = areaManager.update(self) // Evento para verificar si se cambia de area
  //   if (self.canMove(nuevaPos) && !change) {
  //       position = nuevaPos
  //       console.println(self.position())
  //   }
  // }
  
  method canMove(pos) {
    // TODO: verificarColisiones(pos)
    return pos.x() >= 0 && pos.x() < game.width() && 
            pos.y() >= 0 && pos.y() < game.height()&& !colissionHandler.verifyColission(pos)
  }
}