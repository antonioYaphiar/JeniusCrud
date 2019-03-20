//
//  ContactListPresenter.swift
//  jeniusCrud
//
//  Created by antonio yaphiar on 20/03/19.
//  Copyright © 2019 antonio yaphiar. All rights reserved.
//

import Foundation

class ContactListPresenter: ContactListPresenterProtocol {

    var view: ContactListViewProtocol?
    var interactor: ContactInputInteractorProtocol?
    var router: ContactListRouterProtocol?
    
    func addNewContact() {
        router?.presentToAddNewContact(view: view!)
    }
    
    func toContactDetail(contact: Contact?) {
        router?.pushToContactDetail(view: view!, contact: contact)
    }
    
    func getList() {
        interactor?.getAllContactAPI()
    }

}

extension ContactListPresenter: ContactOutputInteractorProtocol {
    func onSuccessRequest(data: Any) {
        let contactList = data as! ContactData
        view?.showContactList(contacts: contactList.data!)
    }
    
    func onFailedRequest(message: String) {
        
    }
    
    
}
