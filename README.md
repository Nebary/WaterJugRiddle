# WaterJugRiddle
Water Jug Riddle

* The only pod attached is SwiftLint
* Two different solution used (RightStrategy and LeftStrategy), the most efficient one will be used as result
* The app uses MVVM architectural pattern
* The app uses Strategy design pattern
* Dependency inversion principle used to present abstract layer for different path finders (SolutionStrategy)
* Dependency injection technique presented in AppDelegate which injects two path finders to SolutionViewController
* Storyboard used to build UI as there is just one view and no team
