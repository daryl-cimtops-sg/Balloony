//
//  MenuViewController.swift
//  Balloony
//
//  Created by Daryl Gialolo on 20/8/24.
//

import UIKit
import SwiftUI

final class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    private let tableView = UITableView()
    private let menuItems = MenuItem.allCases
    
    var selectedMenu: MenuItem = .shop
    let selectMenu: (MenuItem) -> Void
    
    init(selectMenu: @escaping (MenuItem) -> Void = { _ in }) {
        self.selectMenu = selectMenu
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.transform = .init(scaleX: 1, y: -1)
        tableView.rowHeight = 51
        tableView.backgroundColor = .clear
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuItemTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        
        title = "Menu"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! MenuItemTableViewCell
        cell.contentView.transform = .init(scaleX: 1, y: -1)
        
        let menu = menuItems[indexPath.row]
        cell.configure(with: menu.rawValue)
        cell.updateColor(menu == selectedMenu)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let selectedMenu = menuItems[indexPath.row]
        selectMenu(selectedMenu)
    }
}

struct MenuView: UIViewControllerRepresentable {

    var selectMenu: (MenuItem) -> Void
    typealias UIViewControllerType = MenuViewController
       
   func makeUIViewController(context: Context) -> UIViewControllerType {
       let vc = UIViewControllerType(selectMenu: selectMenu)
       return vc
   }
   
   func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
       
   }
}

// MARK: - Preview
@available(iOS 17, *)
#Preview {
    let vc = MenuViewController()
    vc.view.backgroundColor = .init(Colors.background.color)
    return vc
}
