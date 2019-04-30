/// Implementation of SolutionStrategy protocol which goes in right direction.
struct RightStrategy: SolutionStrategy {

    func findPath(_ xAmount: Int, _ yAmount: Int, _ zAmount: Int, completion: @escaping ([PathTuple]) -> Void) {
        let xJug = Jug(size: xAmount)
        let yJug = Jug(size: yAmount)
        let solution = BasicSolution(xJug, yJug, zAmount)
        solution.process {
            if solution.path.last?.0 == .noSoltion {
                completion([])
            } else {
                completion(solution.path)
            }
        }
    }

}
