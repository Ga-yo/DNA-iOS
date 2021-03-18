//
//  Networking.swift
//  DNA
//
//  Created by 장서영 on 2021/02/21.
//

import Foundation
import Alamofire


enum NetworkingAPI{
    case email
    case refreshToken
    case signUp(_ name: String, _ email: String, _ password: String)
    case Login(_ email: String, _ password: String)
    case Logout
    case commentList(_ size: Int, _ page: Int)
    case commentWr(_ timelineId: Int, _ content: String)
    case deleteComment
    case timeLine(_ size: Int, _ page: Int)
    case timeLineWr(_ title: String, _ content: String, _ type: String)
    case deleteTimeLine
    
    
    var path: String {
        switch self {
        case .email :
            return "/email?email=" + ConfirmEmail
        case .Login, .refreshToken :
            return "/auth"
        case .Logout:
            return "/logout"
        case .signUp :
            return "/signup"
        case .commentList, .commentWr :
            return "/comment"
        case .deleteComment:
            return "/comment"
        case .timeLine:
            return "/timeline/{type}?size=&page="
        case .timeLineWr:
            return "/timeline"
        case .deleteTimeLine:
            return "/timeline"
            
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .Login, .signUp, .email:
            return nil
        case .refreshToken :
            let refreshToken : String = "token"
            let userDefault = UserDefaults.standard
            userDefault.set(refreshToken, forKey: "refresh-Token")
            userDefault.synchronize(  )
            guard let token = userDefault.string(forKey: "refresh-Token") else {return nil}
            return ["Authorization" : "Bearer" + "token"]
            
        default:
            let accessToken : String = "access-token"
            let userDefault = UserDefaults.standard
            userDefault.set(accessToken, forKey: "access-token")
            userDefault.synchronize( )
            guard let token = userDefault.string(forKey: "access-token") else { return nil }
            return ["Authorization" : "Bearer" + "token"]
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .Login(let email, let password):
            print(["email":email, "password":password])
            return ["email":email, "password":password]
        
        case .signUp(let name, let email, let password):
            print(["name":name, "email":email, "password":password])
            return ["name":name, "email":email, "password":password]
            
        default:
            return [:]
        }
    }
}
