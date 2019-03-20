//
//  AddNewContactProtocol.swift
//  jeniusCrud
//
//  Created by antonio yaphiar on 14/10/18.
//  Copyright © 2019 antonio yaphiar. All rights reserved.
//

import Foundation

protocol AddNewContactViewProtocol: class {
    func requestSaveContactAPI()
    func requestDeleteContactAPI()
    func requestUpdateContactAPI()
    
    func setViewForNewContact()
    func setViewForEditContact()
    func setViewEnable(isEnable: Bool)
    func activateEditForm()
    
    func setContact() -> Contact
    func pickerViewDonePressed()
    func presentGalleryPage()
    func dismissPage()
    func showYearPicker()
    
}

protocol AddNewContactPresenterProtocol: class {
    var view: AddNewContactViewProtocol? { get set }
    var interactor: ContactInputInteractorProtocol? { get set }
    var router: AddNewContactRouterProtocol? { get set }
    
    func requestSaveContactAPI(contact: Contact?)
    func requestUpdateContactAPI(contact: Contact?)
    func requestDeleteContactAPI(contact: Contact?)
    
    func dismissPage()
}

protocol AddNewContactRouterProtocol: class {
    static func initPresenter(vc: AddContactController) -> AddNewContactPresenterProtocol
    func dismissPage(view: AddNewContactViewProtocol)
}
