import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainFlow: MainFlowController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = UINavigationController()
        mainFlow = MainFlowController(navigationController: rootViewController)
        mainFlow.runFlow()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }

}
