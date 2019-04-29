/// Step representation
///
/// - noSoltion: This is always the finall step. Means that the riddle has no solution.
/// - solutionInX: This is always the finall step. Riddle has the solution and X jug contains amount needed to fill Z.
/// - solutionInY: This is always the finall step. Riddle has the solution and Y jug contains amount needed to fill Z.
/// - fillX: X jug should be filled from the lake.
/// - fillY: Y jug should be filled from the lake.
/// - transferXToY: Water from X jug should be transfered to Y jug.
/// - transferYToX: Water from Y jug should be transfered to X jug.
/// - emptyX: X jug should be empty. Move all the water to the lake.
/// - emptyY: Y jug should be empty. Move all the water to the lake.
enum Step: String, Hashable {

    case noSoltion = "No solution found!"
    case solutionInX = "X has amount of Z"
    case solutionInY = "Y has amount of Z"
    case fillX = "Fill the X"
    case fillY = "Fill the Y"
    case transferXToY = "Transfer X to Y"
    case transferYToX = "Transfer Y to X"
    case emptyX = "Empty X"
    case emptyY = "Empty Y"

    /// Reverts the meaning of some states.
    ///
    /// - Returns: reverted (if applicable) meaning of the current step.
    func reverse() -> Step {
        switch self {
        case .solutionInX:
            return .solutionInY
        case .solutionInY:
            return .solutionInX
        case .fillX:
            return .fillY
        case .fillY:
            return .fillX
        case .transferXToY:
            return .transferYToX
        case .transferYToX:
            return .transferXToY
        case .emptyX:
            return .emptyY
        case .emptyY:
            return .emptyX
        default:
            return self
        }
    }

}
