import UIKit

protocol FlowController {
    func runFlow()
}

class MainFlowController: FlowController {
    private var rootNavigationController: UINavigationController
    private var albumFlowController: AlbumFlowController!

    init(navigationController: UINavigationController) {
        self.rootNavigationController = navigationController
    }

    func runFlow() {
        albumFlowController = AlbumFlowController(navigationController: rootNavigationController)
        albumFlowController.runFlow()
    }
}