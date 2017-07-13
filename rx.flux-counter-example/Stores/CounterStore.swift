//
//  SampleStore.swift
//  rx.flux
//
//  Created by Hung Dinh Van on 6/26/17.
//  Copyright © 2017 ChuCuoi. All rights reserved.
//

import Foundation
import RxFlux
import RxCocoa
import RxSwift

final class CounterStore: Store<CountState> {
    init(dispatcher: Dispatcher, rules: [Rule]? = nil) {
        super.init(initialState: CountState(), dispatcher: dispatcher, rules: rules ?? [])
    }
}

struct CountState {
    var currentValue: Int = 0
}
