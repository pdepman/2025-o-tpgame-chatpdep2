import src.system.levelsManager.levelsManager
import src.system.soundManager.*
import src.gameManager.*
import src.system.gameStatus.*
import src.inputManager.movements.*
import src.characters.snake.snake.solidSnake
import wollok.game.*
import src.ui.visual.*


/*
 * Contiene la lógica para manejar los inputs del juego (keyboard, mouse, etc)
 */

// Keyboard inputs
object keyboardManager {
    /*
     * Genera los listener de eventos asociados al teclado
     */
    method initKeyboard() {
        // Movimiento Snake
        keyboard.up().onPressDo({
            movement.moveUp(solidSnake)
        })
        keyboard.down().onPressDo({ 
            movement.moveDown(solidSnake)
        })
        keyboard.left().onPressDo({ 
            movement.moveLeft(solidSnake)
        })
        keyboard.right().onPressDo({ 
            movement.moveRight(solidSnake)
        })

        // Iniciar nivel 1 desde pantalla inicial
        keyboard.space().onPressDo({ 
            if(game.hasVisual(start)) { 
                levelsManager.loadLevel1()
                soundManager.playBGSound()
            } 
            if(gameCurrentStatus.isGameOver()) { gameManager.restartGame() }  
        })
        
        keyboard.a().onPressDo({ solidSnake.pickItem() })   // recoger
        keyboard.s().onPressDo({ solidSnake.dropItem() })   // soltar
        keyboard.d().onPressDo({ solidSnake.useItem() })    // usar
        keyboard.p().onPressDo({ gameManager.togglePause() })  // pausar/reanudar juego})

        // Mostrar mapa del nivel
        keyboard.m().onPressDo({ 
            game.addVisual(levelMap)
            game.schedule(2500, {game.removeVisual(levelMap)})
        })

        // Mostrar mensaje de ayuda
        keyboard.h().onPressDo({ 
            game.addVisual(helpMessage)
            game.schedule(3000, {game.removeVisual(helpMessage)})
        })

        // salir del juego
        keyboard.q().onPressDo({ 
            if(game.hasVisual(gameOverScreen) || game.hasVisual(winnerScreen)){
                game.stop()
            }
        })

    }
}