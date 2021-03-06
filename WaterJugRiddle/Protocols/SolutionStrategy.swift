/// SolutionStrategy protocol should be implemented by any class/struct which proveds the way to solve the riddle.
protocol SolutionStrategy {

    /// Tries to resolve the riddle and provide steps as the completion result.
    ///
    /// - Parameters:
    ///   - xAmount: Size of X jug.
    ///   - yAmount: Size of Y jug.
    ///   - zAmount: Size of Z jug.
    ///   - completion: Completaion handler contains array of steps and states to solve the riddle.
    ///                 Empty array if there is no solution.
    func findPath(_ xAmount: Int, _ yAmount: Int, _ zAmount: Int, completion: @escaping ([PathTuple]) -> Void)

}

typealias PathTuple = (Step, State)
