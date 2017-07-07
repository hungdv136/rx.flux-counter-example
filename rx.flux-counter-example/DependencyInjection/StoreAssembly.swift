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
        container.register(CounterStore.self) { r in
            return CounterStore()
        }.inObjectScope(.weak)
    }
}
