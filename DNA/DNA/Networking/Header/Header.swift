//
//  Headers.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import Foundation
import Alamofire

struct Token {
    static var _token: String?
    static var token: String? {
        get {
            _token = UserDefaults.standard.string(forKey: "token")
            return _token
        }
        set(newToken) {
            UserDefaults.standard.setValue(newToken, forKey: "token")
            _token = UserDefaults.standard.string(forKey: "token")
        }
    }
    
    static func tokenRemove() {
        token = nil
    }
}

enum Header {
    case token, tokenIsEmpty
    
    func header() -> HTTPHeaders {
        
        do {
            let token = Token.token
        } catch {
            print("error")
        }
//        guard let token = Token.token else {
//            return ["Content-Type" : "application/json"]
//        }
        
        switch self {
        case .token:
            return ["Authorization" : "Bearer " + "eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2MjMzMjE3NzYsInN1YiI6ImFzZGZhc2RmQGRzbS5ocy5rciIsImV4cCI6MTYyMzMyODk3NiwidHlwZSI6ImFjY2Vzc190b2tlbiJ9.8HvJqXaPfdlorpTqZJQLY5dUdZUxtDXcBPPQmptsaj8", "Content-Type" : "application/json"]
        case .tokenIsEmpty:
            return ["Content-Type" : "application/json"]
        }
    }
}

