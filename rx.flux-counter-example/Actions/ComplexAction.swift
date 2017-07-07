//
//  ComplexAction.swift
//  rx.flux
//
//  Created by Hung Dinh Van on 7/7/17.
//  Copyright © 2017 ChuCuoi. All rights reserved.
//

import RxFlux
import RxSwift

final class ComplexAction: AsyncAction<CounterStore.State, Int> {
    typealias State = CounterStore.State
    
    override func reduce(state: CountState, result: Int) -> CountState? {
        var state = state
        state.currentValue *= result
        return state
    }
    
    override func execute(state: State) -> Observable<Int> {
        return Observable<Int>.interval(5, scheduler: MainScheduler.instance).map { _ in 2 }
    }
    
    override var store: Store<State>? {
        return DI.resolve() as CounterStore?
    }
}
