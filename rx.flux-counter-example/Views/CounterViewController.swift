//
//  CounterViewController.swift
//  rx.flux
//
//  Created by Hung Dinh Van on 6/26/17.
//  Copyright © 2017 ChuCuoi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import PureLayout
import RxFlux

final class CounterViewController: UIViewController {
    init(counterStore: CounterStore) {
        self.counterStore = counterStore
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(stackView)
        
        counterStore.state
            .map { "\($0.currentValue)" }
            .drive(textField.rx.text)
            .disposed(by: disposeBag)
        
        Observable.merge(minusButton.rx.tap.map { -1 }, plusButton.rx.tap.map { 1 })
            .flatMap { IncreaseAction(additionValue: $0).dispatchAsObservable() }
            .subscribe()
            .disposed(by: disposeBag)
        
        complexButton.rx.tap
            .flatMap { ComplexAction().dispatchAsObservable() }
            .trackingHUD()
            .subscribe()
            .disposed(by: disposeBag)
        
        IncreaseAction(additionValue: 1).dispatch()
    }
    
    // MARK: Properties
    
    private lazy var textField: UITextField = self.createTextField()
    private lazy var minusButton: UIButton = self.createButton(title: "-")
    private lazy var plusButton: UIButton = self.createButton(title: "+")
    private lazy var complexButton: UIButton = self.createButton(title: "Complex")
    private lazy var stackView: UIStackView = self.createStackView([self.textField, self.minusButton, self.plusButton, self.complexButton])
    private let disposeBag = DisposeBag()
    private let counterStore: CounterStore
}

