//
//  ViewController.swift
//  Sign In Revised
//
//  Created by Sue Ni on 11/27/20.
//

import UIKit

protocol SaveDelegate: class {
    func save(newName: String, newId: String, newDate:String, newTime:String)
}

class ViewController: UIViewController {
    var tableView: UITableView!

    let reuseIdentifier = "entryCellReuse"
    let cellHeight: CGFloat = 75

    var Entries: [Entry]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Sign In Sheet"
        view.backgroundColor = .white
        //let e1 = Entry(name: "Sue Ni", id: "39295")
        Entries = []
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(add))

        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(EntryTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = cellHeight
        view.addSubview(tableView)

        setupConstraints()
    }
    func setupConstraints() {
//        Setup the constraints for our views
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func add() {
        let vc = AddViewController(delegate:self)
        navigationController?.pushViewController(vc, animated: true)
        //tableView.reloadData()
    }

}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Entries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! EntryTableViewCell
        let entry = Entries[indexPath.row]
        cell.configure(for: entry)
        return cell
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let Entry = Entries[indexPath.row]
//        let vc = AddViewController(delegate:self, titleString: Entry.name, idString: Entry.id, index: indexPath)
//        navigationController?.pushViewController(vc, animated: true)
//        tableView.reloadData()
//    }
    
    func tableView(_ tableView: UITableView,leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?{
        let hand =  { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            let cell = tableView.cellForRow(at: indexPath) as! EntryTableViewCell
            let entry = self.Entries[indexPath.row]
            entry.out()
            cell.configure(for: entry)
            success(true)
            tableView.reloadData()
        }
        let closeAction = UIContextualAction(style: .normal, title: "Sign Out", handler: hand)
        closeAction.backgroundColor = .green
        return UISwipeActionsConfiguration(actions: [closeAction])
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            Entries.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
    
    
}
extension ViewController: SaveDelegate {
    func save(newName: String, newId: String, newDate:String, newTime:String) {
        let entry = Entry(name: newName, id: newId, date:newDate, time:newTime)
        Entries.append(entry)
        tableView.reloadData()
    }
}
