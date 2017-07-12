//
//  GeoLocationEntity.swift
//  MKRXLocalization
//
//  Created by Maciej Kowszewicz on 19.06.2017.
//  Copyright © 2017 Maciej Kowszewicz. All rights reserved.
//

import Mapper

struct GeoLocation: Mappable {

    let ip: String
    let contryName: String
    let contryCode: String
    let regionCode: String
    let regionName: String
    let city: String
    let zipCode: String
    let timeZone: String
    let latitude: Double
    let longitude: Double
    let metroCode: Int

    init(map: Mapper) throws {
        try ip = map.from("ip")
        try contryName = map.from("country_name")
        try contryCode = map.from("country_code")
        try regionCode = map.from("region_code")
        try regionName = map.from("region_name")
        try city = map.from("city")
        try zipCode = map.from("zip_code")
        try timeZone = map.from("time_zone")
        try latitude = map.from("latitude")
        try longitude = map.from("longitude")
        try metroCode = map.from("metro_code")
    }
}
