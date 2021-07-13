//
//  SignInModel.swift
//  DNA
//
//  Created by 장서영 on 2021/06/09.
//

import Foundation

struct SignInModel: Codable {
    var access_token = String()
    var refresh_token = String()
    var refresh_exp = Int()
    
    init(access_token: String, refresh_token: String, refresh_exp: Int) {
        self.access_token = access_token
        self.refresh_token = refresh_token
        self.refresh_exp = refresh_exp
    }
}
