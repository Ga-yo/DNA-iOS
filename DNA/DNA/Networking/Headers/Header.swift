//
//  Header.swift
//  DNA
//
//  Created by 장서영 on 2021/06/03.
//

import Foundation
import Alamofire

struct token {
    var _token : String?
    var token: String? {
        
    }
}

enum Header {
    case token, tokenIsEmpty
    
    func getHeader() -> HTTPHeaders {
         guard let token = Token.token else { return ["Content-Type" : "application/json"] }
         
         switch self {
         case .tokenIsExist:
             return HTTPHeaders(["x-access-token" : token, "Content-Type" : "application/json"])
         case .tokenIsEmpty:
             return HTTPHeaders(["Content-Type" : "application/json"])
         }
     }
    
}
