import src.objectPool.objectPool
import src.levels.factory.*
import src.system.colissions.colissionHandler
import src.inputManager.inputManager.keyboardManager
import src.levels.level01.*
import wollok.game.*
import src.characters.snake.*
import src.system.visual.*
import src.levels.areaManager.*

/*
 * Configuración principal del juego
 * Inicializa todos los sistemas en el orden correcto
 */
object config {
    method load() {
        console.println("╔════════════════════════════════════════╗")
        console.println("║       METAL GEAR NES - INICIANDO       ║")
        console.println("╚════════════════════════════════════════╝")
        
        game.title("Metal Gear NES")
        game.cellSize(64)
        game.height(12)
        game.width(20)
        game.boardGround("black.png")

        console.println("[1/7] Inicializando Object Pool")
        objectPool.initializeLevel01()

        console.println("[2/7] Activando área inicial")
        objectPool.activateArea("area01")

        console.println("[3/7] Inicializando CollisionHandler")
        colissionHandler.initialize()

        console.println("[4/7] Cargando colisiones de otras áreas en background")
        game.schedule(2000, { objectPool.loadOtherAreasCollisionsAsync("area01") })

        console.println("[5/7] Inicializando controles de teclado")
        keyboardManager.initKeyboard()

        console.println("[6/7] Inicializando guardias")
        areaManager.launchGuardsBehavior()

        console.println("[7/7] Cargando intro")
        levelsManager.loadIntro()


        console.println("¡Juego listo!")
    }
}
/*
 * Manejador de niveles
 */
object levelsManager {
    method loadIntro() {
        self.clearGame()
        game.addVisual(start)
        game.addVisual(startMessage)
    }
    
    method loadLevel1() {
        self.clearGame()
        solidSnake.initialize()
        solidSnake.position(game.at(13, 1))
        area01.load()
    }
    
    method clearGame() {
        game.allVisuals().forEach { visual => 
            game.removeVisual(visual) 
        }
    }
}