//
//  FirstView.swift
//  TaxiApp
//
//  Created by Ismayil Ismayilov on 03.05.22.
//

import Foundation
import UIKit
import SnapKit

class FirstView : UIView {
    
    //MARK: - Variables
    private let historyCell = "history_cell"
    
    let histories : [History] = [
        History(mainLocation: "Mall of the Emirates Metro ", secondaryLocation: "Dubai, al barsha 1 - mall of the emirates", locationImage: UIImageView(image: UIImage(named: "location1"))),
        History(mainLocation: "Internet city - Business tower", secondaryLocation: "Dubai, internet city - barsha heights...", locationImage: UIImageView(image: UIImage(named: "location2")))
    ]
    
    //MARK: - UI Components
    private lazy var searchView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 27.5
        view.clipsToBounds = true
        view.backgroundColor = hexStringToUIColor(hex: "#F1F1F5")
        return view
    }()
    
    private lazy var headerLabel : UILabel = {
        let label = UILabel()
        label.text = "Where you want to go ?"
        
        guard let customFont = UIFont(name: "Montserrat-SemiBold", size: 22) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = .black
        
        return label
    }()
    
    private lazy var lineImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: "line"))
        return image
    }()
    
    private lazy var historyLabel : UILabel = {
        let label = UILabel()
        label.text = "History"
        
        guard let customFont = UIFont(name: "Montserrat-SemiBold", size: 18) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#19104E")
        
        return label
    }()
    
//    private lazy var searchLabel : UILabel = {
//        let label = UILabel()
//        label.text = "Enter destination"
//
//        guard let customFont = UIFont(name: "Montserrat-Medium", size: 16) else {
//            fatalError()
//        }
//
//        label.font = UIFontMetrics.default.scaledFont(for: customFont)
//        label.adjustsFontForContentSizeCategory = true
//
//        label.textColor = hexStringToUIColor(hex: "#757478")
//
//        return label
//    }()
    
    private lazy var searchText : UITextField = {
       let field = UITextField()
        field.placeholder = "Enter destination"
        field.textAlignment = .left
        return field
    }()
    
    private lazy var searchIcon : UIImageView = {
        let image = UIImageView(image: UIImage(named: "search"))
        return image
    }()
    
    lazy var tableView : UITableView = {
        let view = UITableView()
        
        view.delegate = self
        view.dataSource = self
        
        view.register(HistoryTableViewCell.self, forCellReuseIdentifier: self.historyCell)
        
        view.separatorStyle = .none
        
        return view
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    //MARK: - Parent Delegate
    private func setupUI() {
        
        self.backgroundColor = .white
        
        self.addSubview(self.searchView)
        self.addSubview(self.headerLabel)
        self.addSubview(self.lineImage)
        self.addSubview(self.historyLabel)
        self.searchView.addSubview(self.searchIcon)
        self.searchView.addSubview(self.searchText)
        self.addSubview(self.tableView)
        
        //MARK: - Constraints
        self.lineImage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(16)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(63)
            make.height.equalTo(4)
        }
        
        self.headerLabel.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(30)
            make.top.equalTo(self.lineImage.snp.bottom).offset(24)
        }
        
        self.searchView.snp.makeConstraints { make in
            make.top.equalTo(self.headerLabel.snp.bottom).offset(16)
            make.left.equalTo(self.snp.left).offset(28)
            make.right.equalTo(self.snp.right).offset(-28)
            make.height.equalTo(55)
        }
        
        self.searchIcon.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(25)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
        self.searchText.snp.makeConstraints { make in
            make.left.equalTo(self.searchIcon.snp.right).offset(18.5)
            make.centerY.equalToSuperview()
        }
        
        self.historyLabel.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(28)
            make.top.equalTo(self.searchView.snp.bottom).offset(24)
        }
        
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.historyLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(28)
            make.right.equalToSuperview().offset(-28)
            make.bottom.equalToSuperview()
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.ontap(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func ontap (_ sender : UITapGestureRecognizer ) {
        self.endEditing(true)
    }
}

//MARK: - Extension
extension FirstView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.histories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.historyCell, for: indexPath) as! HistoryTableViewCell
        let historyItem = histories[indexPath.row]
        cell.setup(item: historyItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}

//MARK: - Structs
struct History {
    var mainLocation : String
    var secondaryLocation : String
    var locationImage : UIImageView
}
