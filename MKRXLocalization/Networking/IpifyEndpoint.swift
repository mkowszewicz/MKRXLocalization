//
//  IpifyEndpoint.swift
//  MKRXLocalization
//
//  Created by Maciej Kowszewicz on 19.06.2017.
//  Copyright © 2017 Maciej Kowszewicz. All rights reserved.
//

import Foundation
import Moya

enum Ipify {
    case ip()
}

extension Ipify: TargetType {

    var baseURL: URL { return URL(string: "https://api.ipify.org?format=json")! }

    var path: String {
        switch self {
        case .ip(): return "/"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var parameters: [String: Any]? {
        return nil
    }

    var sampleData: Data {
        switch self {
        case
            .ip():
            return "{\"ip\":\"127.0.0.1\"}".data(using: .utf8)!
        }
    }

    var task: Task {
        return .request
    }

    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
}
