import Foundation

class BasicSolution {

    var xJug: Jug
    var yJug: Jug
    var zAmount: Int
    var path: [(Step, State)]
    var states: Set<State>

    var currentState: State { return State(xJug, yJug) }

    /// Convenient initializer
    ///
    /// - Parameters:
    ///   - xJug: X jug object.
    ///   - yJug: Y jug object.
    ///   - zAmount: Z jug size.
    init(_ xJug: Jug, _ yJug: Jug, _ zAmount: Int) {
        self.xJug = xJug
        self.yJug = yJug
        self.zAmount = zAmount
        path = []
        states = []
    }

    /// Append the path with next step and current state.
    ///
    /// - Parameter step: Next step.
    private func appendPath(_ step: Step) {
        path.append((step, currentState))
    }

    /// Process the data and build the steps to solve the riddle
    private func process() {
        //Make sure, that we have new state, otherwise return early, as there is no solution.
        guard !states.contains(currentState) else {
            appendPath(.noSoltion)
            return
        }

        //Make sure, that X jug doesn't contain Z amount of water, otherwise the solution already found.
        guard xJug.current != zAmount else {
            appendPath(.solutionInX)
            return
        }

        //Make sure, that Y jug doesn't contain Z amount of water, otherwise the solution already found.
        guard yJug.current != zAmount else {
            appendPath(.solutionInY)
            return
        }

        states.insert(currentState)
        //Actual finding algorithm.
        if xJug.isEmpty {
            xJug.fill()
            appendPath(.fillX)
            process()
        } else {
            if yJug.isFull {
                yJug.empty()
                appendPath(.emptyY)
            }
            let transferAmount = min(yJug.amountLeft, xJug.current)
            xJug.current -= transferAmount
            yJug.current += transferAmount
            appendPath(.transferXToY)
            process()
        }
    }

    /// Process the riddle asynchronously.
    ///
    /// - Parameter completion: processing completion handler.
    func process(completion: @escaping () -> Void) {
        DispatchQueue.global().async {
            self.process()
            DispatchQueue.main.async { [weak self] in
                guard self != nil else { return }
                completion()
            }
        }
    }

}
