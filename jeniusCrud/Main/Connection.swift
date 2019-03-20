//
//  Connection.swift
//  jeniusCrud
//
//  Created by antonio yaphiar on 20/03/19.
//  Copyright © 2019 antonio yaphiar. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

protocol BaseCallback{
    
    func onSuccessResponse<T>(message: String, response: DataResponse<T>)
    
}

class ConnectionManager {
    
    var mainCallback: BaseCallback?
    var view: UIView!
    var viewController: UIViewController?
    
    func connectionCallback<T>(responseData: DataResponse<T>) -> Void{
        let statusResponse = responseData.result
        var message = ""
        
        if statusResponse.isSuccess {
            
            print("success")
            let mainResponse = responseData.result.value as? BaseResponse
            message = mainResponse?.message ?? ""
            
            if let httpStatusCode = responseData.response?.statusCode {
                if httpStatusCode >= 200 && httpStatusCode < 400{
                    print("200")
                    mainCallback?.onSuccessResponse(message: message, response: responseData)
                } else {
                    print("< 200")
                    showErrorAlert(message: message)                    
                }
            }
        } else {
            print("failed")
            showErrorAlert(message: "There is problem in our server. Please try again later")
        }
        
    }
    
    private func showErrorAlert(message: String?) {
        
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okBtn)
        viewController?.present(alertController, animated: true, completion: nil)
    }
}
