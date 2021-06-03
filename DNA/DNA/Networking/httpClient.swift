//
//  httpClient.swift
//  DNA
//
//  Created by 장서영 on 2021/02/21.
//

import Foundation
import Alamofire

protocol HTTPCleintProvider {
    func get(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest
    func post(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest
    func put(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest
    func delete(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest
    
}

class HTTPClient: HTTPCleintProvider {
    
    let baseURL = "http://211.38.86.92:8080"
    
    func get(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: header,
                          interceptor: nil)
    }
    
    func post(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: header,
                          interceptor: nil)
    }
    
    func put(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: header,
                          interceptor: nil)
    }
    
    func delete(url: String, params: Parameters?, header: HTTPHeaders) -> DataRequest {
        return AF.request(baseURL + url,
                          method: .get,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers: header,
                          interceptor: nil)
    }
}
