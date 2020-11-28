//
//  EntryTableViewCell.swift
//  Sign In Revised
//
//  Created by Sue Ni on 11/27/20.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    var nameLabel: UILabel!
    var idLabel: UILabel!
    //var dateLabel:UILabel!
    var timeLabel:UILabel!
//    var id: UILabel!
    var timeOut:UILabel!


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none

        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 16)
        contentView.addSubview(nameLabel)

        idLabel = UILabel()
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.font = .systemFont(ofSize: 16)
        contentView.addSubview(idLabel)
        
//        id = UILabel()
//        id.text = "Student Id:"
//        id.translatesAutoresizingMaskIntoConstraints = false
//        id.font = .systemFont(ofSize: 16)
//        contentView.addSubview(id)
        
//        dateLabel = UILabel()
//        dateLabel.translatesAutoresizingMaskIntoConstraints = false
//        dateLabel.font = .systemFont(ofSize: 16)
//        contentView.addSubview(dateLabel)
        
        timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = .systemFont(ofSize: 12)
        contentView.addSubview(timeLabel)
        
        timeOut = UILabel()
        //timeOut.text = ""
        timeOut.translatesAutoresizingMaskIntoConstraints = false
        timeOut.font = .systemFont(ofSize: 12)
        contentView.addSubview(timeOut)

        
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {

        let padding: CGFloat = 8
        //let width: CGFloat = 80
        let height: CGFloat = 20

        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: height)
        ])

        NSLayoutConstraint.activate([
            idLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            idLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            idLabel.heightAnchor.constraint(equalToConstant: height)
        ])
        
        
//        NSLayoutConstraint.activate([
//            id.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
//            id.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
//            id.heightAnchor.constraint(equalToConstant: height)
//        ])
        
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            timeLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor),
            timeLabel.heightAnchor.constraint(equalToConstant: height)
        ])
        
        NSLayoutConstraint.activate([
            timeOut.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor),
            timeOut.topAnchor.constraint(equalTo: timeLabel.topAnchor),
            timeOut.heightAnchor.constraint(equalToConstant: height)
        ])
        
    }

    func configure(for Entry: Entry) {
        nameLabel.text = Entry.name
        idLabel.text = Entry.id
        nameLabel.backgroundColor = Entry.bgcolor
        timeLabel.text = "Signed in \(Entry.date) at \(Entry.time)"
        let date = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        let time = timeFormatter.string(from: date)
        if !Entry.on{
            timeOut.text = ""
        }else{
            timeOut.text = " Signed out at \(time)"
        }
    }

    
}
