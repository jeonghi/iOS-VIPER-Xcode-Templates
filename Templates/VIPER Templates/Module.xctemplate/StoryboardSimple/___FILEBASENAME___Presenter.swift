//___FILEHEADER___
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class ___VARIABLE_moduleName___Presenter {
    
    // MARK: - Private properties -

    private unowned let view: ___VARIABLE_moduleName___ViewInterface
    private let wireframe: ___VARIABLE_moduleName___WireframeInterface

    // MARK: - Lifecycle -

    init(view: ___VARIABLE_moduleName___ViewInterface, wireframe: ___VARIABLE_moduleName___WireframeInterface) {
        self.view = view
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension ___VARIABLE_moduleName___Presenter: ___VARIABLE_moduleName___PresenterInterface {
}
