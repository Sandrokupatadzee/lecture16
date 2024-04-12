//
//  firstScreen.swift
//  lecture16
//
//  Created by MacBook Pro on 11.04.24.
//

import UIKit

class firstScreen: UIViewController {
    
    var tableView = UITableView()
    var contacts =  [ContactData]()
    var sectionTitle = [String]()
    var contactDict = [String: [ContactData]]()
    var addContactName: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "iOS Squad"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        generateTableView()
        addContactsArray()
        addHeader()
    }
    
    func generateTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 30
        tableView.pin(to: view)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
    }
    
    func addHeader() {
        
        let tableHeaderView = TableViewHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 130))
        self.tableView.tableHeaderView = tableHeaderView
    }
    
    func addContactsArray() {
        
        contacts = [
            
            ContactData(fullName: "Nodar Ghachava", age: 28, gender: .male, hobby: "hiking in the Caucasus mountains"),
            ContactData(fullName: "Elene Donadze", age: 21, gender: .female, hobby: "collecting vintage Georgian jewelry"),
            ContactData(fullName: "Temuri Chitashvili", age: 26, gender: .male, hobby: "developing open-source software"),
            ContactData(fullName: "Irina Datoshvili", age: 24, gender: .female, hobby: "practicing aerial silk dancing"),
            ContactData(fullName: "Tornike Elqanashvili", age: 27, gender: .male, hobby: "playing classical guitar"),
            ContactData(fullName: "Ana Ioramashvili", age: 22, gender: .female, hobby: "writing short fantasy stories"),
            ContactData(fullName: "Nini Bardavelidze", age: 23, gender: .female, hobby: "studying marine biology"),
            ContactData(fullName: "Barbare Tepnadze", age: 25, gender: .female, hobby: "exploring minimalist baking"),
            ContactData(fullName: "Mariam Sreseli", age: 20, gender: .female, hobby: "learning new languages"),
            ContactData(fullName: "Valeri Mekhashishvili", age: 30, gender: .male, hobby: "competitive chess playing"),
            ContactData(fullName: "Zuka Papuashvili", age: 24, gender: .male, hobby: "restoring classic cars"),
            ContactData(fullName: "Nutsa Beriashvili", age: 24, gender: .female, hobby: "curating modern art exhibitions"),
            ContactData(fullName: "Luka Kharatishvili", age: 28, gender: .male, hobby: "documentary filmmaking"),
            ContactData(fullName: "Data Robakidze", age: 27, gender: .male, hobby: "urban gardening"),
            ContactData(fullName: "Nika Kakhniashvili", age: 29, gender: .male, hobby: "skydiving"),
            ContactData(fullName: "Sandro Gelashvili", age: 25, gender: .male, hobby: "digital music production"),
            ContactData(fullName: "Ana Namgaladze", age: 21, gender: .female, hobby: "photographing street fashion"),
            ContactData(fullName: "Bakar Kharabadze", age: 30, gender: .male, hobby: "mountain biking"),
            ContactData(fullName: "Archil Menabde", age: 27, gender: .male, hobby: "crafting handmade pottery"),
            ContactData(fullName: "Tamuna Kakhidze", age: 22, gender: .female, hobby: "volunteering at animal shelters"),
            ContactData(fullName: "Giorgi Michitashvili", age: 23, gender: .male, hobby: "bird watching"),
            ContactData(fullName: "Salome Topuria", age: 23, gender: .female, hobby: "yoga and meditation"),
            ContactData(fullName: "Luka Gujejiani", age: 29, gender: .male, hobby: "competitive video gaming"),
            ContactData(fullName: "Gega Tatulishvili", age: 26, gender: .male, hobby: "exploring virtual reality tech"),
            ContactData(fullName: "Raisa Badalova", age: 24, gender: .female, hobby: "ballet dancing"),
            ContactData(fullName: "Aleksandre Saroiani", age: 28, gender: .male, hobby: "astronomy and telescope making"),
            ContactData(fullName: "Begi Kopaliani", age: 29, gender: .male, hobby: "collecting rare vinyl records"),
            ContactData(fullName: "Akaki Titberidze", age: 26, gender: .male, hobby: "kayaking in whitewater rivers"),
            ContactData(fullName: "Sandro Kupatadze", age: 27, gender: .male, hobby: "scuba diving in the black sea"),
            ContactData(fullName: "Gvantsa Gvagvalia", age: 22, gender: .female, hobby: "organic gardening"),
            ContactData(fullName: "Vano Kvakhadze", age: 24, gender: .male, hobby: "studying quantum physics")
        ]
        
//        MARK: ეს კოდი იუთუბიდანაა, ძაან მაწვალა, გაგიზიარებთ ვიდეოს, ისიც როგორ წვალობს იცინებთ
        
        sectionTitle = Array(Set(contacts.compactMap({String($0.fullName.prefix(1))})))
        sectionTitle.sort()
        sectionTitle.forEach({contactDict[$0] = [ContactData]()})
        contacts.forEach({contactDict[String($0.fullName.prefix(1))]?.append($0)})
    }
}

extension firstScreen: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitle.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactDict[sectionTitle[section]]?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.textLabel?.text = contactDict[sectionTitle[indexPath.section]]?[indexPath.row].fullName
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionTitle[section]
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        sectionTitle
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextScreen = secondScreen()
        if let contact = contactDict[sectionTitle[indexPath.section]]?[indexPath.row] {
            nextScreen.contact = contact
            navigationController?.pushViewController(nextScreen, animated: false)
        }
    }
}



