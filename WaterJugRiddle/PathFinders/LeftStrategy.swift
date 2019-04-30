/// Implementation of SolutionStrategy protocol which goes in left (reverted) direction.
/// Sometime most efficient way of resolving riddle is to go to opposite (reverted) direction.
struct LeftStrategy: SolutionStrategy {

    func findPath(_ xAmount: Int, _ yAmount: Int, _ zAmount: Int, completion: @escaping ([PathTuple]) -> Void) {
        let xJug = Jug(size: xAmount)
        let yJug = Jug(size: yAmount)

        //We send the jugs to solution finder in reverted way. The result will be reverted as well.
        let solution = BasicSolution(yJug, xJug, zAmount)
        solution.process {
            if solution.path.last?.0 == .noSoltion {
                completion([])
            } else {
                completion(solution.path.map { ($0.0.reversed, $0.1.reversed) })
            }
        }
    }

}
