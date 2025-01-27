//___FILEHEADER___
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class ___VARIABLE_moduleName___Wireframe: BaseWireframe<___VARIABLE_moduleName___ViewController> {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "___VARIABLE_moduleName___", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: ___VARIABLE_moduleName___ViewController.self)
        super.init(viewController: moduleViewController)

        let interactor = ___VARIABLE_moduleName___Interactor()
        let presenter = ___VARIABLE_moduleName___Presenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension ___VARIABLE_moduleName___Wireframe: ___VARIABLE_moduleName___WireframeInterface {
}
