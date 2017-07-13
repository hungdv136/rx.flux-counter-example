//
//  RxExtensions.swift
//  rx.flux-counter-example
//
//  Created by Hung Dinh Van on 7/11/17.
//  Copyright © 2017 ChuCuoi. All rights reserved.
//

import RxSwift
import RxFlux
import SVProgressHUD

extension ObservableType where E == ActionEvent {
    func trackingHUD() -> Observable<E> {
        return observeOn(MainScheduler.instance).do(onNext: {
            switch $0 {
            case .start:
                SVProgressHUD.show(withStatus: nil)
                
            case .completed, .failed:
                SVProgressHUD.dismiss()
                
            case .retry:
                break
            }
        })
    }
}
