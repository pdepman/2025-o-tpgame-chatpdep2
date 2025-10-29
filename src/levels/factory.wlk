import src.system.gameStatus.*
import src.system.system.levelsManager
import src.system.colissions.colissionHandler
import src.obstacles.invisibleObject.Invisible
import src.characters.guards.patrollGuard.*
import src.characters.guards.staticsGuard.*
import wollok.game.*
import src.levels.tilemap.*

object areaFactory {
    const match_tile = new Dictionary()

    method initializeMatchTile() {
        match_tile.put(tileTypes.empty(), { pos => self.doNothing(pos)  })
        match_tile.put(tileTypes.staticGuard(), { pos => self.createStaticGuard(pos) })
        match_tile.put(tileTypes.patrolGuard(), { pos => self.createPatrolGuard(pos) })
        match_tile.put(tileTypes.door(), { pos => self.createDoor(pos) })
        match_tile.put(tileTypes.box(), { pos => self.createBox(pos) })
        match_tile.put(tileTypes.redKey(), { pos => self.createRedKey(pos) })
        match_tile.put(tileTypes.blueKey(), { pos => self.createBlueKey(pos) })
        match_tile.put(tileTypes.weapon(), { pos => self.createWeapon(pos) })
        match_tile.put(tileTypes.health(), { pos => self.createHealth(pos) })
        match_tile.put(tileTypes.collision(), { pos => self.createInvisibleCollision(pos) })
    }

method createFromMatrix(tileMatrix) {
    const totalRows = tileMatrix.size()
    var rowIndex = 0

    tileMatrix.forEach { fila =>
        var x = 0
        const y = (totalRows - 1) - rowIndex   // invertís eje solo una vez por fila

        fila.forEach { tile =>
            const pos = game.at(x, y)
            self.createNewObjectFromMatrix(tile, pos)
            x = x + 1
        }

        rowIndex = rowIndex + 1
    }
}


    // Recibo como parámetro "que" y "en que posición"
    method createNewObjectFromMatrix(tile, pos){
        const newTile = match_tile.basicGet(tile)

        // Si el tile es vacío, no hago nada
        if (newTile.toString() == "{ pos => self.doNothing(pos)  }") {
            return
        }
        const newObject = newTile.apply(pos)

        // Si el objeto fue creado, lo registro en el manejador de colisiones
        if (newObject != null) {
            console.println("Creado: " + newObject.className() + " en " + pos + "\n")
            if (newObject.esColisionable()) {
                colissionHandler.register(newObject)
            }
        }
        return
    }

    //Solo para que no rompa y poder manejar los tiles vacíos
    method doNothing(pos){ }

    // Métodos particulares para instaniar los objetos
    method createStaticGuard(pos){
        const static = new StaticGuard(position = pos, lastPosition = pos)
        game.addVisual(static)
        gameCurrentStatus.actualArea().addGuard(static) 
        return static
    } 

    method createPatrolGuard(pos){
        const patroll = new PatrollGuard(position = pos, lastPosition = pos)
        game.addVisual(patroll)
        gameCurrentStatus.actualArea().addGuard(patroll)
        return patroll
    }

    method createInvisibleCollision(pos){
        const invisible = new Invisible(position = pos)
        game.addVisual(invisible)
        return invisible
    } 

    method createDoor(pos){
        // Por ahora, sigo manejando las puertas como objetos visuales simples
        return null
    }


    // TODO: Implementar estos métodos
    method createBox(pos){
        return null
    }

    method createRedKey(pos){
        return null
    }

    method createBlueKey(pos){
        return null
    }

    method createWeapon(pos){
        return null
    }

    method createHealth(pos){
        return null
    }
}