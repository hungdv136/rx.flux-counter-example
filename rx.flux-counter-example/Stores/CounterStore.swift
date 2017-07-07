//
//  SampleStore.swift
//  rx.flux
//
//  Created by Hung Dinh Van on 6/26/17.
//  Copyright © 2017 ChuCuoi. All rights reserved.
//

import Foundation
import RxFlux

final class CounterStore: Store<CountState> {
    init() {
        super.init(initialState: CountState())
    }
    
    override var persistenceTimeout: Double {
        return 1
    }
    
    override func createRules() -> [Rule] {
        return [CancelRule(ComplexAction.self, cancelBehavior: .latest)]
    }
}

struct CountState {
    var currentValue: Int = 0
}