import Foundation
import CoreGraphics

class SolutionViewModel {

    var cells: [StepCellModel]
    private var paths: [[PathTuple]]

    init(xSize: Double,
         ySize: Double,
         zSize: Double,
         solutionStrategies: [SolutionStrategy],
         completion: @escaping () -> Void) {

        cells = []
        paths = []
        let group = DispatchGroup()
        solutionStrategies.forEach {
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

    var xMultiplier: CGFloat {
        guard xSize != 0 else { return 0 }
        return CGFloat(xAmount) / CGFloat(xSize)
    }
    var yMultiplier: CGFloat {
        guard ySize != 0 else { return 0 }
        return CGFloat(yAmount) / CGFloat(ySize)
    }

}
