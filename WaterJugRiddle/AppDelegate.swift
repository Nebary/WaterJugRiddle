import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        injectDependencies()
        return true
    }

    //Inject path finder dependencies
    func injectDependencies() {
        guard let viewController = window?.rootViewController as? SolutionViewController else { return }
        viewController.pathFinders = [RightPathFinder(), LeftPathFinder()]
    }

}
