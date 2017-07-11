//
//  RxExtensions.swift
//  rx.flux-counter-example
//
//  Created by Hung Dinh Van on 7/11/17.
//  Copyright © 2017 ChuCuoi. All rights reserved.
//

import RxSwift
import SVProgressHUD

extension ObservableType {
    func trackingHUD(dismissOnNext: Bool = false) -> Observable<E> {
        return observeOn(MainScheduler.instance).do(onNext: { _ in
            guard dismissOnNext else { return }
            SVProgressHUD.dismiss()
        }, onSubscribe: {
            SVProgressHUD.show(withStatus: nil)
        }, onDispose: {
            SVProgressHUD.dismiss()
        })
    }
}
