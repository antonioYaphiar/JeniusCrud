//
//  ContactListRouter.swift
//  jeniusCrud
//
//  Created by antonio yaphiar on 20/03/19.
//  Copyright © 2019 antonio yaphiar. All rights reserved.
//

import Foundation
import UIKit

class ContactListRouter: ContactListRouterProtocol {
    
    static func initPresenter(vc: ContactListViewController) -> ContactListPresenterProtocol {
        let presenter: ContactListPresenterProtocol & ContactOutputInteractorProtocol = ContactListPresenter()
        let interactor: ContactInputInteractorProtocol = ContactInteractor()
        let router: ContactListRouterProtocol = ContactListRouter()
        
        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor
        interactor.viewController = vc
        interactor.presenter = presenter
        return presenter
    }
    
    func presentToAddNewContact(view: ContactListViewProtocol) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddContactView")
        if let source = view as? UIViewController {
            source.present(vc, animated: true, completion: nil)
        }
    }
    
    func pushToContactDetail(view: ContactListViewProtocol, contact: Contact?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navVc = storyboard.instantiateViewController(withIdentifier: "AddContactView") as! UINavigationController
        let vc = navVc.viewControllers.first as! AddContactController
        vc.contact = contact
        
        if let source = view as? UIViewController {
            source.present(navVc, animated: true, completion: nil)
        }
    }

}
