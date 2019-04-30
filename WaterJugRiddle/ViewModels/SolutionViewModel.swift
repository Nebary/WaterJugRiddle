import Foundation

class SolutionViewModel {

    var cells: [StepCellModel]
    private var paths: [[PathTuple]]

    init(xSize: Double,
         ySize: Double,
         zSize: Double,
         pathFinders: [PathFinder],
         completion: @escaping () -> Void) {

        cells = []
        paths = []
        let group = DispatchGroup()
        pathFinders.forEach {
            group.enter()
            $0.findPath(Int(xSize), Int(ySize), Int(zSize)) { [weak self] path in
                guard let self = self else { return }
                group.leave()
                self.paths.append(path)
            }
        }
        group.notify(queue: DispatchQueue.main) { [weak self] in
            guard let self = self else { return }
            self.cells = self.paths
                .filter { !$0.isEmpty }
                .min { $0.count < $1.count }?
                .map { StepCellModel(text: $0.0.rawValue,
                                     xAmount: $0.1.xAmount,
                                     yAmount: $0.1.yAmount,
                                     xSize: Int(xSize),
                                     ySize: Int(ySize))
                } ?? []
            completion()
        }
    }

}

struct StepCellModel {
    let text: String
    let xAmount: Int
    let yAmount: Int
    let xSize: Int
    let ySize: Int
}
