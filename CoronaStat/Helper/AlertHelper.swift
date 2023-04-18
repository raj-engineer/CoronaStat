//
//  AlertHelper.swift
//  CoronaStat
//
//  Created by Rajesh Rajesh on 18/04/23.
//
import Foundation
import SwiftUI

class AlertHelper {
    var alertMessage = ""
    static let shared = AlertHelper()
    private init(){}
    
    func showAlert()->Alert {
        return  Alert(title: Text(Alerts.alertTitle),
                      message: Text(alertMessage),
                      dismissButton: Alert.Button.default(
                        Text(Alerts.dismissTitle), action: {
                            // dismiss
                        }
                      )
        )
    }
    
    func handleError(error: Error) {
        if error is NetworkError {
            let networkError = error as! NetworkError
            AlertHelper.shared.alertMessage = networkError.description
        } else {
            AlertHelper.shared.alertMessage = error.localizedDescription
        }
    }
  
}

