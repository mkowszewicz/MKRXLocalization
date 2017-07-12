//
//  ViewController.swift
//  MKRXLocalization
//
//  Created by Maciej Kowszewicz on 18.06.2017.
//  Copyright © 2017 Maciej Kowszewicz. All rights reserved.
//

import Moya
import RxCocoa
import RxSwift
import UIKit

class LocationVC: UIViewController {

    @IBOutlet weak var ipAddressLabel: UILabel!
    @IBOutlet weak var localizationLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var localizeButton: UIButton!

    private let disposeBag = DisposeBag()
    private var providerIp: RxMoyaProvider<Ipify>!
    private var providerLocation: RxMoyaProvider<Freegeoip>!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRx()
    }

    func setupRx() {

        providerIp = RxMoyaProvider<Ipify>()
        providerLocation = RxMoyaProvider<Freegeoip>()

        let ipAddressModel = IpAddressModel(provider: providerIp)
        let geoLocationModel = GeoLocationModel(provider: providerLocation)

        // Get ip address
        let ip = localizeButton
            .rx.tap
            .throttle(0.3, scheduler: MainScheduler.instance)
            .flatMap {
                ipAddressModel.findIpAddress()
            }.map {
                $0?.ip ?? ""
            }

        // Show ip address on the view
        ip
            .bind(to: ipAddressLabel.rx.text)
            .disposed(by: disposeBag)

        // Get location for ip address
        let location = ip
            .flatMap {
                return geoLocationModel.findLocation(ip: $0)
            }

        // Show location on the view
        location
            .map {
                $0?.city ?? ""
            }
            .bind(to: cityLabel.rx.text)
            .disposed(by: disposeBag)

        location
            .map {
                guard let latitude = $0?.latitude, let longitude = $0?.longitude else {
                    return ""
                }
                return "\(latitude), \(longitude)"
            }
            .bind(to: localizationLabel.rx.text)
            .disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
