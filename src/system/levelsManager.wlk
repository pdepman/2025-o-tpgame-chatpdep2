import wollok.game.*
import src.utils.log.log
import src.characters.snake.snake.solidSnake
import src.levels.level01.*
import src.ui.visual.*

/*
 * Manejador de niveles
 */
object levelsManager {
    method loadIntro() {
        self.clearGame()
        game.addVisual(start)
        game.addVisual(startMessage)
        log.debug(self, "Intro caragada")
    }
    
    method loadLevel1() {
        self.clearGame()
        solidSnake.position(game.at(13, 1))
        area01.load()
        log.debug(self, "Level 01 cargado")
    }
    
    method clearGame() {
        game.allVisuals().forEach { visual => 
            game.removeVisual(visual) 
        }
    }
}