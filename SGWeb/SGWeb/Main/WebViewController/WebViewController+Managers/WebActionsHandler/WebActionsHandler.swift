//
//  WebActionsHandler.swift
//  SGWeb
//
//  Created by Rostyslav Gress on 15.05.22.
//

import Foundation
import UIKit
import WebKit


class WebActionsHandler {
    
    func handleLoadedWebView(_ vc: WebViewController) {
        if let web = vc.formWebView, let model = vc.viewModel {
            var namesString = "..."
            if !model.fullName.isEmpty {
                namesString = model.fullName
            }
            
            var birthDate = "..."
            if !model.dateOfBirth.isEmpty {
                birthDate = model.dateOfBirth
            }
            
            let updateValues = [kEvalName: namesString,
                                kEvalBirth: birthDate] as! [String: String]
            
            for key in updateValues.keys {
                if let value = updateValues[key] {
                    let updateScript = String(format: kEvaluateScript, key, value)
                    web.evaluateJavaScript(updateScript, completionHandler: nil)
                }
            }
        }
    }
    
    func handleScriptMessage(_ message: WKScriptMessage, vc: WebViewController) {
        if let model = vc.viewModel {
            if message.name == kSubmitName {
                if let value = message.body as? String, !value.replacingOccurrences(of: " ", with: "").isEmpty {
                    model.fullName = value
                }
            } else if message.name == kSubmitBirth {
                sleep(5)
                
                if let value = message.body as? String, !value.replacingOccurrences(of: " ", with: "").isEmpty {
                    model.dateOfBirth = value
                    vc.formWebView?.reload()
                }
            } else if message.name == kCleanNames {
                model.fullName    = ""
                model.dateOfBirth = ""
                
                vc.formWebView?.reload()
            }
        }
    }
}
