//
//  ViewController.swift
//  jeniusCrud
//
//  Created by antonio yaphiar on 20/03/19.
//  Copyright © 2019 antonio yaphiar. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var contactTV: UITableView!
    @IBOutlet weak var addNewContactBtn: UIBarButtonItem!
    
    static let GET_CONTACT = "GET_CONTACT"
    var presenter: ContactListPresenterProtocol? = nil
    var contacts = [Contact]()
    var filteredContact = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Contacts"
    
        let contactTVC = UINib(nibName: "ContactCell", bundle: nil)
        contactTV.register(contactTVC, forCellReuseIdentifier: "contact_cell")
        
        presenter = ContactListRouter.initPresenter(vc: self)
        
        searchBar.delegate = self;
        
        addNewContactBtn.target = self
        addNewContactBtn.action = #selector(presentToAddNewContact)
        requestContactList()
        
        NotificationCenter.default.addObserver(self, selector: #selector(requestContactList),name: NSNotification.Name(rawValue: ContactListViewController.GET_CONTACT), object: nil)
    }
    


}

extension ContactListViewController: ContactListViewProtocol  {
   
    func showLoading() {
        
    }
    
    func dismissLoading() {
        
    }
    
    func showContactList(contacts: [Contact]) {
        self.contacts = contacts
        self.filteredContact = contacts
        contactTV.reloadData()
    }
    
    @objc func requestContactList() {
        presenter?.getList()
    }
    
    @objc func presentToAddNewContact() {
        presenter?.addNewContact()
    }
    
    func pushToContactDetail(index: Int) {
            presenter?.toContactDetail(contact: filteredContact[index])
    }
}


extension ContactListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact_cell") as! ContactTableViewCell
            cell.setContact(contact: filteredContact[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredContact.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        pushToContactDetail(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    
}

extension ContactListViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText:String){
        if searchText != "" {
            
            filteredContact = contacts.filter {contact in
                let fullname = contact.firstName! + contact.lastName!
                return   fullname.lowercased().contains(searchText.lowercased())
                
            }
        }else {
            self.filteredContact = contacts
            
        }
        self.contactTV.reloadData()
    }
}


