import src.levels.factory.*
import src.system.colissions.*
import src.gameObject.GameObject
import src.characters.guards.patrollGuard.*
import src.characters.guards.staticsGuard.*
import src.obstacles.invisibleObject.*
import src.levels.tilemap.*


import src.characters.snake.*
import src.system.system.*
import wollok.game.*
import src.system.visual.*
import src.levels.areaManager.*

// Defino las areas del nivel
// Ver si conviene hacer una clase abstracta Area y que las areas hereden de ella
class Area {
    const property tileMatrix // Matriz de tiles del area
    const property changeEvents = [] // Lista de eventos de cambio de area
    var property name = ""
    const background // Imagen de fondo del area 

    // Lista de guardias pertenecientes a esta área
    var guardList = []

    method guards() = guardList

    // Permite agregar un guardia al área
    method addGuard(guard) {
        if (guard != null) {
            guardList.add(guard)
        }
    }

    // Limpia todos los guardias del área
    method clearGuards() {
        guardList.clear()
    }

    method load() { 
        // Cargo el fondo del area
        game.addVisual(background)

        // Cargo el tileMap del area
        areaFactory.createFromMatrix(tileMatrix)

        // Cargo a solidSnake
        game.addVisual(solidSnake)

    }

    method removeArea() { 
        colissionHandler.unregisterAll()
        levelsManager.clearGame()
    }

    method addChangeEvent(event) {
        changeEvents.add(event)
    }

    method checkAreaChange(character) {
        return changeEvents.findOrDefault({e => e.canCharacterChangeArea(character)}, null)
    }
}

// Instancias de areas del nivel 1
const area01 = new Area(
    background = area01BG,
    name = "Area 01",
    changeEvents = [goToArea02, goToArea03A, goToArea03B],
    tileMatrix = tileMapArea01
)

const area02 = new Area(
    background = area02BG,
    name = "Area 02",
    changeEvents = [goToArea01],
    tileMatrix = tileMapArea02
)

const area03 = new Area(
    background = area03BG,
    name = "Area 03",
    changeEvents = [goToArea01A, goToArea01B],
    tileMatrix = tileMapArea03
)

const area04 = new Area(
    background = area04BG,
    name = "Area 04",
    changeEvents = [],
    tileMatrix = tileMapArea04
    
)

const area05 = new Area(
    background = area05BG,
    name = "Area 05",
    changeEvents = [], 
    tileMatrix = tileMapArea05
)

const allRegisteredAreas = [area01, area02, area03, area04, area05]