//
//  IpAddressModel.swift
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

struct IpAddressModel {

    let provider: RxMoyaProvider<Ipify>

    func findIpAddress() -> Observable<IpAddress?> {
        return provider
            .request(Ipify.ip())
            .debug()
            .mapObjectOptional(type: IpAddress.self)
    }
}
