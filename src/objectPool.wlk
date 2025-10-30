import src.levels.factory.areaFactory
import src.system.colissions.colissionHandler
import src.characters.guards.patrollGuard.PatrollGuard
import src.characters.guards.staticsGuard.StaticGuard
import wollok.game.*
import src.gameObject.GameObject
import src.levels.tilemap.*

/*
 * ObjectPool - Pool de objetos pre-instanciados
 * Usa el Factory para crear objetos, pero los mantiene en memoria
 * y solo activa/desactiva según el área actual
 */
object objectPool {

    const guards = []
    const obstacles = []
    const collectibles = []
    const objectsByArea = new Dictionary()

    /*
     * Inicializa todos los objetos del nivel
     */
    method initializeLevel01() {
        console.println("=== Inicializando Object Pool ===")
        
        areaFactory.initializeMatchTile()

        // Listas paralelas (por compatibilidad con Wollok)
        const tileMaps = [tileMapArea01, tileMapArea02, tileMapArea03, tileMapArea04, tileMapArea05]
        const areaNames = ["area01", "area02", "area03", "area04", "area05"]

        var i = 0
        tileMaps.forEach { tileMatrix =>
            const areaName = areaNames.get(i)
            console.println("Cargando objetos de " + areaName + "...")

            const objs = areaFactory.createObjectsFromMatrix(tileMatrix)
            objs.forEach { obj => self.classifyObject(obj) }
            objectsByArea.put(areaName, objs)

            console.println(".") // indicador de progreso
            i = i + 1
        }

        console.println("\n✓ Inicialización completa.")
        console.println("Guardias: " + guards.size() + ", Obstáculos: " + obstacles.size() + ", Coleccionables: " + collectibles.size())
    }

    /*
     * Clasifica los objetos según tipo
     */
    method classifyObject(obj) {
        if (obj == null) { return }

        const cn = obj.className()
        if (cn.contains("Guard")) { guards.add(obj) }
        else if (cn.contains("Invisible") || cn.contains("Door")) obstacles.add(obj)
        else if (cn.contains("Key") || cn.contains("Weapon") || cn.contains("Health") || cn.contains("Box")) collectibles.add(obj)

        return
    }

    /*
     * Activa solo un área
     */
    method activateArea(areaName) {
        const areaObjects = objectsByArea.get(areaName)
        areaObjects.forEach { obj =>
            if (!obj.className().contains("Invisible") && !game.allVisuals().contains(obj)) { 
                obj.activate() 
                if (obj.esColisionable()) { 
                    colissionHandler.register(obj) 
                }
                game.addVisual(obj)
            }

        }
        console.println("✓ Área " + areaName + " activada: " + areaObjects.size() + " objetos")
    }

    /*
     * Desactiva un área
     */
    method deactivateArea(areaName) {
        const areaObjects = objectsByArea.get(areaName)
        areaObjects.forEach { obj =>
            obj.deactivate()
            game.removeVisual(obj)
            if (obj.esColisionable()) colissionHandler.unregister(obj)
        }
        console.println("✓ Área " + areaName + " desactivada")
    }

    /*
     * Carga colisiones de otras áreas en segundo plano
     * (simulación con programador y puntos suspensivos)
     */
    method loadOtherAreasCollisionsAsync(initialArea) {
        const otherAreas = []
        objectsByArea.keys().forEach { areaName =>
            if (areaName != initialArea) otherAreas.add(areaName)
        }

        console.println("Cargando colisiones de otras áreas")

        var delay = 0
        otherAreas.forEach { areaName =>
            game.schedule(delay, {
                objectsByArea.get(areaName).forEach { obj =>
                    if (obj.esColisionable()) colissionHandler.register(obj)
                }
                console.println(".")
            })
            delay = delay + 100
        }

        game.schedule(delay + 300, { console.println(" ¡Listo!") })
    }

    /*
     * Getters y utilidades
     */
    method getObjectsForArea(areaName) = objectsByArea.get(areaName)

    method getAllObjects() = guards + obstacles + collectibles

    method getActiveGuardsForArea(areaName) {
        const areaObjects = objectsByArea.get(areaName)
        return areaObjects.filter { obj => obj.className().contains("Guard") && obj.isActive() }
    }

    method printStats() {
        console.println("=== Object Pool Stats ===")
        console.println("Guardias: " + guards.size())
        console.println("Obstáculos: " + obstacles.size())
        console.println("Coleccionables: " + collectibles.size())
        console.println("Total: " + self.getAllObjects().size())
        console.println("Áreas cargadas: " + objectsByArea.keys().size())
        console.println("========================")
    }
}
