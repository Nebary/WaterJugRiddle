import Foundation

extension UserDefaults {

    /// All the custom keys used by the app to store information in UserDefaults.
    enum Keys: String, CaseIterable {
        case xSize, ySize, zSize
    }

    /// Return or set stored size for X jug.
    var xSize: Double {
        get {
            return double(forKey: Keys.xSize.rawValue)
        }
        set {
            set(newValue, forKey: Keys.xSize.rawValue)
        }
    }

    /// Return or set stored size for Y jug.
    var ySize: Double {
        get {
            return double(forKey: Keys.ySize.rawValue)
        }
        set {
            set(newValue, forKey: Keys.ySize.rawValue)
        }
    }

    /// Return or set stored size for Z jug.
    var zSize: Double {
        get {
            return double(forKey: Keys.zSize.rawValue)
        }
        set {
            set(newValue, forKey: Keys.zSize.rawValue)
        }
    }

    /// Checks UserDefaults for existence of the record with provided key.
    ///
    /// - Parameter key: A key in the current user‘s defaults database.
    /// - Returns: true if the UserDefaults contains a record with such key.
    func exists(key: String) -> Bool {
        return object(forKey: key) != nil
    }

    /// Wipes all the custom records from UserDefaults.
    /// The keys to be removed from UserDefaults enumerated in Keys enum.
    func wipe() {
        Keys.allCases.forEach { removeObject(forKey: $0.rawValue) }
    }

}
