//
//  GeoLocationModel.swift
//  MKRXLocalization
//
//  Created by Maciej Kowszewicz on 19.06.2017.
//  Copyright © 2017 Maciej Kowszewicz. All rights reserved.
//

import Foundation
import Moya
import Mapper
import Moya_ModelMapper
import RxSwift

struct GeoLocationModel {

    let provider: RxMoyaProvider<Freegeoip>

    func findLocation(ip: String) -> Observable<GeoLocation?> {
        return provider
            .request(Freegeoip.location(ip: ip))
            .debug()
            .mapObjectOptional(type: GeoLocation.self)
    }
}
