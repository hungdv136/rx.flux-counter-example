//
//  TodoInitialAction.swift
//  rx.flux-counter-example
//
//  Created by Hung Dinh Van on 7/27/17.
//  Copyright © 2017 ChuCuoi. All rights reserved.
//

import RxFlux

final class TodoInitialAction: Action<TodoStore.State> {
    typealias State = TodoStore.State
    
    override func reduce(state: State) -> State? {
        var state = state
        state.items = ["todo item #1", "todo item #2"]
        return state
    }
    
    override var store: Store<State>? {
        return DI.resolve() as TodoStore?
    }
}
