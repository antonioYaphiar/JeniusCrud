//
//  Endpoint.swift
//  jeniusCrud
//
//  Created by antonio yaphiar on 20/03/19.
//  Copyright © 2019 antonio yaphiar. All rights reserved.
//

import Foundation

class Endpoint {
    
    private let BASE_URL = "https://simple-contact-crud.herokuapp.com/"
    
    private let contact = "contact"
    
    func contactAPI() -> String {
        return "\(BASE_URL)\(contact)"
    }
    
    func contactAPI(id: String) -> String {
        return "\(BASE_URL)\(contact)/\(id)"
    }
}
