import UIKit

extension String {

    /// Convenient function to trim whitespaces and new lines from the string.
    ///
    /// - Returns: A new string made by removing from both ends of the String whitespaces and new line characters.
    func trimmed() -> String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

}
