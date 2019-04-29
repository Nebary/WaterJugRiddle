/// Implementation of PathFinder protocol which goes in right direction.
struct RightPathFinder: PathFinder {

    func findPath(_ xAmount: Int, _ yAmount: Int, _ zAmount: Int, completion: @escaping ([Step]) -> Void) {
        let xJug = Jug(size: xAmount)
        let yJug = Jug(size: yAmount)
        let solution = BasicSolution(xJug, yJug, zAmount)
        solution.process {
            if solution.path.last == .noSoltion {
                completion([])
            } else {
                completion(solution.path)
            }
        }
    }

}
