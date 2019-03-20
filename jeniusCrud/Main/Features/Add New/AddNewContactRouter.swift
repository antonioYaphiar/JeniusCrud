//
//  AddNewContactRouter.swift
//  jeniusCrud
//
//  Created by antonio yaphiar on 14/10/18.
//  Copyright © 2019 antonio yaphiar. All rights reserved.
//

import Foundation
import UIKit

class AddNewContactRouter: AddNewContactRouterProtocol {
    static func initPresenter(vc: AddContactController) -> AddNewContactPresenterProtocol {
        let presenter: AddNewContactPresenterProtocol & ContactOutputInteractorProtocol = AddNewContactPresenter()
        let interactor: ContactInputInteractorProtocol = ContactInteractor()
        let router: AddNewContactRouterProtocol = AddNewContactRouter()
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.viewController = vc
        interactor.presenter = presenter
        return presenter
    }
    
    func dismissPage(view: AddNewContactViewProtocol) {
        if let source = view as? UIViewController {
            source.dismiss(animated: true, completion: nil)
        }
    }
}
