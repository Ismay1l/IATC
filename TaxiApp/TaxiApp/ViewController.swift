//
//  ViewController.swift
//  TaxiApp
//
//  Created by Ismayil Ismayilov on 02.05.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: - Variables
    private let settingCell = "setting_cell"
    
    private let options : [Option] = [
        Option(circleIcon: UIImageView(image: UIImage(named: "user")), optionText: "Profile info"),
        Option(circleIcon: UIImageView(image: UIImage(named: "card")), optionText: "Cards"),
        Option(circleIcon: UIImageView(image: UIImage(named: "setting")), optionText: "Settings"),
        Option(circleIcon: UIImageView(image: UIImage(named: "clock")), optionText: "Activities"),
        Option(circleIcon: UIImageView(image: UIImage(named: "wallet-2")), optionText: "My wallet")
    ]
    
    //MARK: UI Components
    private lazy var scrollView : UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.isScrollEnabled = false
        return view
    }()
    
    private lazy var headerLabel : UILabel = {
        let label = UILabel()
        label.text = "Profile"
        
        guard let customFont = UIFont(name: "Montserrat-Regular", size: 20) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#19104E")
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var bellView : UIView = {
        let view = UIView()
        view.backgroundColor = hexStringToUIColor(hex: "#FFFFFF")
        view.layer.cornerRadius = 22
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var bellIcon : UIImageView = {
        let view = UIImageView(image: UIImage(named: "bell2"))
        return view
    }()
    
    private lazy var profileView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 60
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var profilePicture : UIImageView = {
        let image = UIImageView(image: UIImage(named: "background"))
        return image
    }()
    
    private lazy var profileIcon : UIImageView = {
        let icon = UIImageView(image: UIImage(named: "person"))
        return icon
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Amelia Barlow"
        
        guard let customFont = UIFont(name: "Montserrat-Regular", size: 20) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#19104E")
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var middleView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 24
        view.clipsToBounds = true
        view.backgroundColor = hexStringToUIColor(hex: "#5256E8")
        return view
    }()
    
    private lazy var winningLabel : UILabel = {
        let label = self.makeLabel(text: "You won 300 points", fontType: "Montserrat-Bold", size: 24)
        return label
    }()
    
    private lazy var thankingLabel : UILabel = {
        let label = self.makeLabel(text: "Thanks for riding with us! you won 300 point from your last ride", fontType: "Montserrat-Medium", size: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var redeemLabel : UILabel = {
        let label = self.makeLabel(text: "Redeem now 🔥", fontType: "Montserrat-Medium", size: 12)
        label.layer.cornerRadius = 24
        label.clipsToBounds = true
        label.backgroundColor = .white
        label.textColor = hexStringToUIColor(hex: "#5256E8")
        label.textAlignment = .center
        return label
    }()
    
    private lazy var tableView : UITableView = {
        let view = UITableView()
        
        view.delegate = self
        view.dataSource = self
        
        view.register(SettingTableViewCell.self, forCellReuseIdentifier: self.settingCell)
        view.isScrollEnabled = false
        
        view.layer.cornerRadius = 24
        view.clipsToBounds = true
        
        return view
    }()
    
    //MARK: - Parent Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = hexStringToUIColor(hex: "#E5E5E5")
        self.view.isUserInteractionEnabled = true
        
        //MARK: - Subviews
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.headerLabel)
        self.scrollView.addSubview(self.bellView)
        self.scrollView.addSubview(self.bellIcon)
        self.scrollView.addSubview(self.profileView)
        self.profileView.addSubview(self.profilePicture)
        self.profileView.addSubview(self.profileIcon)
        self.scrollView.addSubview(self.nameLabel)
        self.scrollView.addSubview(self.middleView)
        self.middleView.addSubview(self.winningLabel)
        self.middleView.addSubview(self.redeemLabel)
        self.middleView.addSubview(self.thankingLabel)
        self.scrollView.addSubview(self.tableView)
        
        //MARK: - Constraints
        self.scrollView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        self.headerLabel.snp.makeConstraints { make in
            make.top.equalTo(self.scrollView.contentLayoutGuide.snp.top).offset(40)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
        }
        
        self.bellView.snp.makeConstraints { make in
            make.centerY.equalTo(self.headerLabel.snp.centerY)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-28)
            make.width.height.equalTo(44)
        }
        
        self.bellIcon.snp.makeConstraints { make in
            make.center.equalTo(self.bellView.snp.center)
            make.width.equalTo(15)
            make.height.equalTo(20)
        }
        
        self.profileView.snp.makeConstraints { make in
            make.top.equalTo(self.headerLabel.snp.bottom).offset(26)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
            make.width.height.equalTo(120)
        }
        
        self.profilePicture.snp.makeConstraints { make in
            make.top.equalTo(self.headerLabel.snp.bottom).offset(26)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
            make.width.height.equalTo(120)
        }
        
        self.profileIcon.snp.makeConstraints { make in
            make.top.equalTo(self.profileView.snp.top).offset(32)
            make.centerX.equalTo(self.profileView.snp.centerX)
            make.width.height.equalTo(88)
        }
        
        self.nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.profileView.snp.bottom).offset(24)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
        }
        
        self.middleView.snp.makeConstraints { make in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(16)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(30)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-30)
            make.height.equalTo(180)
        }
        
        self.winningLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
        }
        
        self.thankingLabel.snp.makeConstraints { make in
            make.top.equalTo(self.winningLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(42)
            make.right.equalToSuperview().offset(-42)
        }
        
        self.redeemLabel.snp.makeConstraints { make in
            make.top.equalTo(self.thankingLabel.snp.bottom).offset(12)
            make.bottom.equalToSuperview().offset(-24)
            make.centerX.equalToSuperview()
            make.width.equalTo(140)
        }
        
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.middleView.snp.bottom).offset(24)
            make.left.equalTo(self.scrollView.contentLayoutGuide.snp.left).offset(30)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-30)
            make.bottom.equalTo(self.scrollView.contentLayoutGuide.snp.bottom).offset(-16)
            make.height.equalTo(381)
            make.width.equalTo(334)
        }
        
        //MARK: - GestureRecognizers
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.onPinchGesture(_:)))
        pinchGesture.delegate = self
        self.middleView.addGestureRecognizer(pinchGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.onPanGesture(_:)))
        panGesture.delegate = self
        self.middleView.addGestureRecognizer(panGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(self.onRotateGesture(_:)))
        rotateGesture.delegate = self
        self.middleView.addGestureRecognizer(rotateGesture)
    }
    
    //MARK: - Functions
    private func makeLabel (text: String, fontType: String, size: Int) -> UILabel {
        let label = UILabel()
        label.text = text
        
        guard let customFont = UIFont(name: fontType, size: CGFloat(size)) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor  = .white
        
        return label
    }
    
    @objc func onPinchGesture (_ sender : UIPinchGestureRecognizer ) {
        
        if sender.state == .changed {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            sender.scale = 1.0
        }
    }
    
    var initialCenter = CGPoint()
    var newCenter = CGPoint()
    
    @objc func onPanGesture (_ sender: UIPanGestureRecognizer ) {
        
        let piece = sender.view!
        let translation = sender.translation(in: piece.superview)
        
        if sender.state == .began {
            self.initialCenter = piece.center
            self.scrollView.isScrollEnabled = false
        }
        
        if sender.state != .cancelled {
            self.newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
            piece.center = newCenter
        }
        
        if sender.state == .ended {
            self.scrollView.isScrollEnabled = true
        }
    }
    
    @objc func onRotateGesture (_ sender: UIRotationGestureRecognizer) {
        
        if sender.state == .changed {
            sender.view?.transform = (sender.view?.transform.rotated(by: sender.rotation))!
            sender.rotation = 0
        }
    }
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

//MARK: - Extension
extension ViewController : UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.settingCell, for: indexPath) as! SettingTableViewCell
        let settingItem = options[indexPath.row]
        cell.setup(option: settingItem)
        return cell
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

//MARK: - Structs
struct Option {
    var circleIcon : UIImageView
    var optionText : String
}

