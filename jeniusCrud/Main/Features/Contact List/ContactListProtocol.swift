//
//  ContactListProtocol.swift
//  jeniusCrud
//
//  Created by antonio yaphiar on 20/03/19.
//  Copyright © 2019 antonio yaphiar. All rights reserved.
//

import Foundation
import UIKit

protocol ContactListViewProtocol: class {
    func showLoading()
    func dismissLoading()
    
    func showContactList(contacts: [Contact])
    func requestContactList()
    func presentToAddNewContact()
    func pushToContactDetail(index: Int)
}

protocol ContactListPresenterProtocol: class {
    var view: ContactListViewProtocol? { get set }
    var interactor: ContactInputInteractorProtocol? { get set }
    var router: ContactListRouterProtocol? { get set }
    
    func addNewContact()
    func toContactDetail(contact: Contact?)
    func getList()
}


protocol ContactListRouterProtocol: class {
    static func initPresenter(vc: ContactListViewController) -> ContactListPresenterProtocol
    func presentToAddNewContact(view: ContactListViewProtocol)
    func pushToContactDetail(view: ContactListViewProtocol, contact: Contact?)

}
