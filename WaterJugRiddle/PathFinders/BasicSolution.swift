import Foundation

class BasicSolution {

    var xJug: Jug
    var yJug: Jug
    var zAmount: Int
    var path: [Step]
    var states: Set<State>

    init(_ xJug: Jug, _ yJug: Jug, _ zAmount: Int) {
        self.xJug = xJug
        self.yJug = yJug
        self.zAmount = zAmount
        path = []
        states = []
    }

    /// Process the data and build the steps to solve the riddle
    private func process() {
        let currentState = State(xJug, yJug)

        //Make sure, that we have new state, otherwise return early, as there is no solution.
        guard !states.contains(currentState) else {
            path.append(.noSoltion)
            return
        }

        //Make sure, that X jug doesn't contain Z amount of water, otherwise the solution already found.
        guard xJug.current != zAmount else {
            path.append(.solutionInX)
            return
        }

        //Make sure, that Y jug doesn't contain Z amount of water, otherwise the solution already found.
        guard yJug.current != zAmount else {
            path.append(.solutionInY)
            return
        }

        states.insert(currentState)
        //Actual finding algorithm.
        if xJug.current == 0 {
            //If jug is empty, fill it from the lake.
            path.append(.fillX)
            xJug.fill()
            process()
        } else {
            if yJug.current == yJug.max {
                //If jug is full, empty it.
                path.append(.emptyY)
                yJug.empty()
            }
            path.append(.transferXToY)
            let howMuchToFill = min((yJug.max - yJug.current), xJug.current)
            xJug.current -= howMuchToFill
            yJug.current += howMuchToFill
            process()
        }
    }

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
