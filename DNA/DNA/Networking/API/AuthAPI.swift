//
//  AuthAPI.swift
//  DNA
//
//  Created by 장서영 on 2021/06/03.
//

import Foundation

enum AuthAPI : API {
    case email(_ confirmId: String)
    case refreshToken
    case signUp(_ name: String, _ email: String, _ password: String)
    case Login(_ email: String, _ password: String)
    case Logout
    
    func path() -> String {
        switch self {
        case .email(let confirmId) :
            return "/email?email=" + confirmId
        case .Login, .refreshToken :
            return "/auth"
        case .Logout:
            return "/logout"
        case .signUp :
            return "/signup"
        }
    }
}
