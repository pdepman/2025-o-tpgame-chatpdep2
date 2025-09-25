object pepita {
  var energy = 100

  method energy() = energy

  method fly(minutes) {
    energy = energy - minutes * 3
  }
}

object solidSnake{
  var property position=game.origin()
  method image()="snake_parado.png" 

}