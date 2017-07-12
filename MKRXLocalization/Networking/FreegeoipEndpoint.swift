//
//  FreegeoipEndpoint.swift
//  MKRXLocalization
//
//  Created by Maciej Kowszewicz on 19.06.2017.
//  Copyright © 2017 Maciej Kowszewicz. All rights reserved.
//

import Foundation
import Moya

enum Freegeoip {
    case location(ip: String)
}

extension Freegeoip: TargetType {

    var baseURL: URL { return URL(string: "https://freegeoip.net/json")! }

    var path: String {
        switch self {
        case let .location(ip): return "/\(ip)"
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
        case .location: return "{\"ip\":\"127.0.0.1\",\"country_code\":\"\",\"country_name\":\"\",\"region_code\":\"\",\"region_name\":\"\",\"city\":\"\",\"zip_code\":\"\",\"time_zone\":\"\",\"latitude\":0,\"longitude\":0,\"metro_code\":0}".data(using: .utf8)!
        }
    }

    var task: Task {
        return .request
    }

    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
}
