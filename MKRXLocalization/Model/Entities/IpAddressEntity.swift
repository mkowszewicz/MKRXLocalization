//
//  IpAddressEntity.swift
//  MKRXLocalization
//
//  Created by Maciej Kowszewicz on 19.06.2017.
//  Copyright © 2017 Maciej Kowszewicz. All rights reserved.
//

import Mapper

struct IpAddress: Mappable {
    let ip: String

    init(map: Mapper) throws {
        try ip = map.from("ip")
    }
}
