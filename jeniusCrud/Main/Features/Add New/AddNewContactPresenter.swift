//
//  AddNewContactPresenter.swift
//  jeniusCrud
//
//  Created by antonio yaphiar on 14/10/18.
//  Copyright © 2019 antonio yaphiar. All rights reserved.
//

import Foundation
import UIKit

class AddNewContactPresenter: AddNewContactPresenterProtocol {

    var view: AddNewContactViewProtocol?
    var interactor: ContactInputInteractorProtocol?
    var router: AddNewContactRouterProtocol?
    
    
    func requestSaveContactAPI(contact: Contact?) {
        interactor?.saveContactAPI(contact: contact ?? Contact())
    }
    
    func requestUpdateContactAPI(contact: Contact?) {
        interactor?.editContact(contactId: contact?.id ?? "", contact: contact!)
    }
    
    func requestDeleteContactAPI(contact: Contact?) {
        interactor?.deleteContactAPI(contactId: contact?.id ?? "")
    }
    
    func dismissPage() {
        router?.dismissPage(view: view!)
    }
}

extension AddNewContactPresenter: ContactOutputInteractorProtocol {
    func onSuccessRequest(data: Any) {
        let response = data as! BaseResponse
        let message = response.message
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: ContactListViewController.GET_CONTACT), object: nil, userInfo: nil)

        print("message \(String(describing: message))")
        view?.dismissPage()
        
    }
    
    func onFailedRequest(message: String) {
        
    }
    
    
}
