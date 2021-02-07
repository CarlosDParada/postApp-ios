//
//  PostAppService.swift
//  Data
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation

enum PostAppService {
    case start
    case post
}

extension PostAppService: ServiceContract {
    var baseURL: String {
        return "https://mock.koombea.io/mt/api/"
    }
    var path: String? {
        switch self {
        case .start:
            return nil
        case .post:
            return "/posts"
        }
    }
    var urlRequest: URLRequest? {
        switch self {
        case .start:
            guard let url = URL(string: baseURL) else {
                return nil
            }
            return URLRequest(url: url)
        case .post:
            guard let path = path,
                  let url = URL(string: baseURL + path) else {
                return nil
            }
            return URLRequest(url: url)
        }
    }
}
