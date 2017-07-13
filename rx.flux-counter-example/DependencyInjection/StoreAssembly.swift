//
//  StoreAssembly.swift
//  rx.flux
//
//  Created by Hung Dinh Van on 6/30/17.
//  Copyright © 2017 ChuCuoi. All rights reserved.
//

import Swinject
import RxSwift
import RxFlux

final class StoreAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Dispatcher.self) { r in
            return Dispatcher()
        }.inObjectScope(.container)
        
        container.register(CounterStore.self) { r in
            let dispatcher = r.resolve(Dispatcher.self)!
            let rules = [UniqueRule(ComplexAction.self)]
            return CounterStore(dispatcher: dispatcher, rules: rules)
        }.inObjectScope(.weak)
    }
}
