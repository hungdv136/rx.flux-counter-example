//
//  TodoStore.swift
//  rx.flux-counter-example
//
//  Created by Hung Dinh Van on 7/27/17.
//  Copyright © 2017 ChuCuoi. All rights reserved.
//

import RxFlux
import RxCocoa
import RxSwift

final class TodoStore: Store<TodoState> {
    init(dispatcher: Dispatcher, rules: [Rule]? = nil) {
        super.init(initialState: TodoState(), dispatcher: dispatcher, rules: rules ?? [])
    }
}

struct TodoState {
    var items = [String]()
}

