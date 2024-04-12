//
//  secondScreen.swift
//  lecture16
//
//  Created by MacBook Pro on 12.04.24.
//

import UIKit

class secondScreen: UIViewController {
    
//    MARK: ეს კოდი ვერ ავამუშავე ვერაფრით, როდესაც ვნიშნავ რომელიმე კონტაქტს, მიჩვნებს მონაცემებს, მაგრამ ჰედერში სახელს ვერ ვცვლი.
    
    var contact: ContactData? {
        didSet {
            tableHeaderView?.contactNameLabel.text = contact?.fullName ?? ""
        }
    }
   
    let tableView = UITableView()
    var tableHeaderView: TableViewHeader2?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        generateTableView()
        addHeader()
    }
    
    func generateTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 50
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func addHeader() {
        let headerView = TableViewHeader2(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 130))
        tableHeaderView = headerView
        tableView.tableHeaderView = headerView
    }
    
}

extension secondScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Age: \(contact?.age ?? 0)"
        case 1:
            cell.textLabel?.text = "Gender: \(contact?.gender == .male ? "Male" : "Female")"
        case 2:
            cell.textLabel?.text = "Hobby: \(contact?.hobby ?? "")"
        default:
            break
        }
        return cell
    }
}
