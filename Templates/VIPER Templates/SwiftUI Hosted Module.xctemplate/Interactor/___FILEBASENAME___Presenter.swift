//___FILEHEADER___
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class ___VARIABLE_moduleName___Presenter: ObservableObject {
    
    // MARK: - Private properties -

    private let interactor: ___VARIABLE_moduleName___InteractorInterface
    private let wireframe: ___VARIABLE_moduleName___WireframeInterface

    // MARK: - Lifecycle -

    init(interactor: ___VARIABLE_moduleName___InteractorInterface, wireframe: ___VARIABLE_moduleName___WireframeInterface) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
}