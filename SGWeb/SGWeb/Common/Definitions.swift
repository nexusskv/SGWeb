//
//  Definitions.swift
//  SGWeb
//
//  Created by Rostyslav Gress on 14.05.22.
//

import Foundation
import WebKit


let kSubmitName: String = "SubmitNames"
let kSubmitBirth: String = "SubmitBirth"
let kCleanNames: String = "CleanNames"

let kSubmitNamesScript: String = "document.getElementById('syncsubmit').addEventListener('click', function () {var fName=document.getElementById('firstname').value; var lName=document.getElementById('lastname').value; window.webkit.messageHandlers.%@.postMessage(fName + ' ' + lName);});"

let kSubmitBirthScript: String = "document.getElementById('asyncsubmit').addEventListener('click', function () {var dBirth=document.getElementById('birthdate').value; window.webkit.messageHandlers.%@.postMessage(dBirth);});"

let kCleanNamesScript: String = "document.getElementById('cleannames').addEventListener('click', function () { window.webkit.messageHandlers.%@.postMessage('clean');});"

let kEvalName  = "namesresult"
let kEvalBirth = "birthresult"

let kEvaluateScript = "var updateElement=document.getElementById('%@'); updateElement.innerHTML='%@';"


let kScriptValues: [String: String] = [kSubmitName: kSubmitNamesScript,
                                      kSubmitBirth: kSubmitBirthScript,
                                       kCleanNames: kCleanNamesScript]
