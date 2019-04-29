/// Jug is the basic model to represent the water jug.
/// By conforming to ExpressibleByIntegerLiteral we can initialize it using simple Int values: `let jug: Jug = 1`
struct Jug: ExpressibleByIntegerLiteral {

    let max: Int
    var current: Int

    /// Add ExpressibleByIntegerLiteral conformance.
    ///
    /// - Parameter value: Int value representing the size of the jug.
    init(integerLiteral value: IntegerLiteralType) {
        max = value
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
