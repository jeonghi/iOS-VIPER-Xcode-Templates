//
//  LoginInterfaces.swift
//  Viper-v4-Demo
//
//  Created by Zvonimir Medak on 05.10.2021..
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa

protocol LoginWireframeInterface: WireframeInterface {
}

protocol LoginViewInterface: ViewInterface {
}

protocol LoginPresenterInterface: PresenterInterface {
    func configure(with output: Login.ViewOutput) -> Login.ViewInput
}

protocol LoginInteractorInterface: InteractorInterface {
}

enum Login {

    struct ViewOutput {
    }

    struct ViewInput {
    }

}
