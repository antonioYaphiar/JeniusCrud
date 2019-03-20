//
//  BaseResponse.swift
//  jeniusCrud
//
//  Created by antonio yaphiar on 20/03/19.
//  Copyright © 2019 antonio yaphiar. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseResponse: Mappable {
    var message: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        message <- map["message"]
    }
}
