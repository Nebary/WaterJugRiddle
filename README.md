# WaterJugRiddle
Water Jug Riddle

* The only pod attached is SwiftLint
* Two different solution used (RightPathFinder and LeftPathFinder), the most efficient one will be used as result
* The app uses MVVM pattern
* Dependency inversion used to presend abstract layer for different path finders (PathFinder)
* Dependency injection presented in AppDelegate which injects two path finders to SolutionViewController
* Storyboard used to build UI as there is just one view and no team
