import src.levels.level01.areaManager
object solidSnake{
  var property position=game.origin()
  var property lastMovement="right"


  method image()="snake_"+lastMovement+".png"

  method update() { } // TODO: Implementar
  method esColisionable() = false


  method moverDerecha() {
  position = position.right(1)
  lastMovement = "right"
  }
  method moverIzquierda() {
  position = position.left(1)
  lastMovement = "left"
  }
  method moverArriba() {
  position = position.up(1)
  lastMovement = "up"
  }
  method moverAbajo() {
  position = position.down(1)
  lastMovement = "down"
  }
  
  // method moveTo(nuevaPos) {
  //   if (self.canMove(nuevaPos)) {
  //       position = nuevaPos
  //       // Verificar transiciones después del movimiento
  //       areaManager.verifyTransition()
  //   }
  // }
  
  // method canMove(pos) {
  //   // TODO: verificarColisiones(pos)
  //   return pos.x() >= 0 && pos.x() < game.width() && 
  //           pos.y() >= 0 && pos.y() < game.height()
  // }


}