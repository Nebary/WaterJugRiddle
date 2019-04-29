/// Implementation of PathFinder protocol which goes in left (reverted) direction.
/// Sometime most efficient way of resolving riddle is to go to opposite (reverted) direction.
struct LeftPathFinder: PathFinder {

    func findPath(_ xAmount: Int, _ yAmount: Int, _ zAmount: Int, completion: @escaping ([Step]) -> Void) {
        let xJug = Jug(size: xAmount)
        let yJug = Jug(size: yAmount)

        //We send the jugs to solution finder in reverted way. The result will be reverted as well.
        let solution = BasicSolution(yJug, xJug, zAmount)
        solution.process {
            if solution.path.last == .noSoltion {
                completion([])
            } else {
                completion(solution.path.map { $0.reverse() })
            }
        }
    }

}