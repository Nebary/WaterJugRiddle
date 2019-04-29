/// Jug is the basic model to represent the water jug.
struct Jug {

    let max: Int
    var current: Int

    /// Convenient initializer for the jug object.
    ///
    /// - Parameter size: Int value representing the size of the jug.
    init(size: Int) {
        max = size
        current = 0
    }

    /// Fills the jug from the lake (infinite source of water).
    mutating func fill() {
        current = max
    }

    /// Empties the jug back to the lake.
    mutating func empty() {
        current = 0
    }

}
