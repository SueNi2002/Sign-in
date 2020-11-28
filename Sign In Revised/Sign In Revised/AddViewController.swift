//
//  AddViewController.swift
//  Sign In Revised
//
//  Created by Sue Ni on 11/27/20.
//

import UIKit

class AddViewController: UIViewController {
    var name: UITextField!
    var id: UITextField!
    weak var delegate: SaveDelegate?
    
    init(delegate: SaveDelegate?) {
        super.init(nibName: nil, bundle: nil)
        
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign In", style: .plain, target: self, action: #selector(add))
        name = UITextField()
        id = UITextField()
        id.keyboardType = .numberPad
        setUpTextField(textField: name)
        setUpTextField(textField: id)
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    func setUpTextField(textField:UITextField){
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 30)
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        view.addSubview(textField)
    }
    
    func setupConstraints() {
        // textField constraints
        
        let anchor1:CGFloat = 30
        let anchor2:CGFloat = 50
        let height:CGFloat = 50
        //let size:CGFloat = 200
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: anchor1),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: anchor2),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -anchor2),
            name.heightAnchor.constraint(equalToConstant: height)
            ])
        NSLayoutConstraint.activate([
            id.topAnchor.constraint(equalTo: name.bottomAnchor, constant: anchor1),
            id.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: anchor2),
            id.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -anchor2),
            id.heightAnchor.constraint(equalToConstant: height)
            ])

    }
    
    @objc func add() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/YY"
        let currentDate = formatter.string(from: date)
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        let currentTime = timeFormatter.string(from: date)
        if let text = name.text, text != "", let text1 = id.text,  text1 != ""{
            delegate?.save(newName: text, newId: text1, newDate: currentDate, newTime: currentTime)
        }else{
            let alertController = UIAlertController(title: "Alert", message: "The fields cannot be empty.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Done", style: .default) {_ in }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    

}
