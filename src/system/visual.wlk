import wollok.game.*

/*
 * Definición base para todos los fondos visuales
 * (idea: https://github.com/wollok/bobEsponjaGame  )
*/
class Visual {
	var property image
	var property position = game.origin()
}

// Inicio
const start = new Visual(
	image = "intro.gif",
    position = game.at(3,4)
)

const startMessage = new Visual(
    image = "intro-message.gif",
    position = game.at(5,1)
)

const cetralAreaBG = new Visual(
    image = "central.jpg",
    position = game.origin()
)

const northAreaBG = new Visual(
    image = "north.jpg",
    position = game.origin()
)

const southAreaBG = new Visual(
    image = "south.jpg",
    position = game.origin()
)

const eastAreaBG = new Visual(
    image = "east.jpg",
    position = game.origin()
)

const westAreaBG = new Visual(
    image = "west.jpg",
    position = game.origin()
)