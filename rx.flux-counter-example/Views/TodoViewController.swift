//
//  TodoViewController.swift
//  rx.flux-counter-example
//
//  Created by Hung Dinh Van on 7/27/17.
//  Copyright © 2017 ChuCuoi. All rights reserved.
//

import UIKit
import RxFlux
import RxCocoa
import RxSwift

final class TodoViewController: UITableViewController {
    init(todoStore: TodoStore) {
        self.todoStore = todoStore
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = NSLocalizedString("Todo", comment: "")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: nil, action: nil)
        
        setupTableView()
        TodoInitialAction().dispatch()
    }
    
    private func setupTableView() {
        tableView.delegate = nil
        tableView.dataSource = nil
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableCell")
        
        todoStore.state
            .map { $0.items }
            .drive(tableView.rx.items(cellIdentifier: "TableCell", cellType: UITableViewCell.self)) { row, item, cell in
                cell.textLabel?.text = item
            }
            .addDisposableTo(disposeBag)
    }
    
    
    private let todoStore: TodoStore
    private let disposeBag = DisposeBag()
}
