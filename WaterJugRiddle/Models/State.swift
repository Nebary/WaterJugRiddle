/// Model for the step iteration representation.
/// Basically used to make sure, that the app doesn't iterate through the states it already tried process.
struct State: Hashable {

    let xAmount: Int
    let yAmount: Int

    /// Reverted state.
    var reversed: State { return State(yAmount, xAmount) }

    /// Default initializer
    ///
    /// - Parameters:
    ///   - xAmount: X Jug current amount of water.
    ///   - yAmount: Y Jug current amount of water.
    init(_ xAmount: Int, _ yAmount: Int) {
        self.xAmount = xAmount
        self.yAmount = yAmount
    }

    /// Convenient initializer to use Jug objects to initialize the state.
    ///
    /// - Parameters:
    ///   - xJug: X Jug object
    ///   - yJug: Y Jug object
    init(_ xJug: Jug, _ yJug: Jug) {
        xAmount = xJug.current
        yAmount = yJug.current
    }

}
