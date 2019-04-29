/// Model for the step iteration representation.
/// Basically used to make sure, that the app doesn't iterate through the states it already tried process.
struct State: Hashable {

    let xAmount: Int
    let yAmount: Int

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
