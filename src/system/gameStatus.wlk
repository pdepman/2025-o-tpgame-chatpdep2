import src.levels.level01.*

object gameCurrentStatus {
    const levels = ["level 01", "level 02", "final level"]
    const idxCurrentLevel = 0
    var currentLevel = levels.get(idxCurrentLevel)
    var currentArea = area01

    method actualArea() = currentArea 
    
    method modifyArea(newArea) {
      currentArea = newArea
    }

    method levelUp() {
        if (idxCurrentLevel >= 0 && idxCurrentLevel < levels.size() - 1) {
            currentLevel = levels.get(idxCurrentLevel + 1)
        }
    }

    method currentLevel() = currentLevel
 }