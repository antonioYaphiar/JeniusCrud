//
//  ContactListViewCell.swift
//  jeniusCrud
//
//  Created by antonio yaphiar on 20/03/19.
//  Copyright © 2019 antonio yaphiar. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class ContactListViewCell: UICollectionViewCell {
    
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactNameLbl: UILabel!
    @IBOutlet weak var imageNameLbl: UILabel!
    
    func setContact(contact: Contact?) {
        let firstName = contact?.firstName
        let lastName = contact?.lastName
        
        contactNameLbl.text = "\(firstName ?? "") \(lastName ?? "")"
        contactImageView.backgroundColor = .blue
        
        contactImageView.kf.setImage(with: URL(string: contact?.photo ?? ""))
        contactImageView.setCircularView()
        
        imageNameLbl.text = "\(firstName?.prefix(1) ?? "")\(lastName?.prefix(1) ?? "")"
    }
}
