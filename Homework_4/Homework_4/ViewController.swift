//
//  ViewController.swift
//  Homework_4
//
//  Created by Ismayil Ismayilov on 24.04.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: Variables
    
    let ingredientCell = "ingredient_cell"
    let toppingCell = "topping_cell"
    
    private var weigths : [ProductWeight] = [
        ProductWeight(number: 400, type: "kcal"),
        ProductWeight(number: 510, type: "grams"),
        ProductWeight(number: 30, type: "proteins"),
        ProductWeight(number: 56, type: "carbs"),
        ProductWeight(number: 24, type: "fats")
    ]
    
    private var ingredients : [IngredientCellItems] = [
        IngredientCellItems(image: UIImageView(image: UIImage(named: "egg")), name: "Egg"),
        IngredientCellItems(image: UIImageView(image: UIImage(named: "avocado")), name: "Avocado"),
        IngredientCellItems(image: UIImageView(image: UIImage(named: "salad")), name: "Spinach"),
        IngredientCellItems(image: UIImageView(image: UIImage(named: "salad")), name: "Salad"),
        IngredientCellItems(image: UIImageView(image: UIImage(named: "avocado")), name: "Avocado")
    ]
    
    private var toppings : [Topping] = [
        Topping(name: "Extra eggs", price: 4.20),
        Topping(name: "Extra spinach", price: 2.80),
        Topping(name: "Extra bread", price: 1.80),
        Topping(name: "Extra tomato", price: 2.10),
        Topping(name: "Extra cucumber", price: 1.60),
        Topping(name: "Extra olives", price: 3.50),
        Topping(name: "Extra pepper", price: 1.50),
        Topping(name: "Extra avocado", price: 5.40)
    ]
    
    
    
    //MARK: UI Components
    private lazy var headerView : HeaderPictureView = {
        let view = HeaderPictureView()
        return view
    }()
    
    private lazy var ratingView : RatingView = {
        let view = RatingView()
        return view
    }()
    
    private lazy var generalScrollView : UIScrollView = {
        let view = UIScrollView()
//        view.backgroundColor = .systemPink
        return view
    }()
    
    private lazy var dishView : DishView = {
        let view = DishView()
        return view
    }()
    
    private lazy var priceView : PriceView = {
        let view = PriceView()
        return view
    }()
    
    private lazy var textView : TextView = {
        let view = TextView()
        return view
    }()
    
    private lazy var productWeight : ProductWeightView = {
        let view = ProductWeightView()
        return view
    }()
    
    private lazy var stackView : UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var ingredientLabel : UILabel = {
        let label = UILabel()
        label.text = "Ingredients"
        label.textColor = hexStringToUIColor(hex: "#666687")
        
        guard let customFont = UIFont(name: "Mulish-SemiBold", size: 16) else {
            fatalError("""
                Failed to load the "Mulish-SemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }()
    
    private lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal

        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)

        view.dataSource = self
        view.delegate = self

        view.register(IngredientCollectionViewCell.self, forCellWithReuseIdentifier: self.ingredientCell)

        view.bounces = true
        view.alwaysBounceHorizontal = true

        view.backgroundColor = .systemGray6

        view.showsHorizontalScrollIndicator = false

        return view
    }()
    
    private lazy var toppingLabel : UILabel = {
        let label = UILabel()
        label.text = "Add toppings"
        label.textColor = hexStringToUIColor(hex: "#666687")

        guard let customFont = UIFont(name: "Mulish-SemiBold", size: 16) else {
            fatalError("""
                Failed to load the "Mulish-SemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true

        return label
    }()
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView()

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(ToppingsTableViewcell.self, forCellReuseIdentifier: self.toppingCell)

        tableView.separatorStyle = .none
        
//        tableView.layer.cornerRadius = 16
        
        tableView.backgroundColor = .systemGray6
        
        return tableView
    }()
    
    private lazy var requestLabel : UILabel = {
        let label = UILabel()
        label.text = "Add a request"
        label.textColor = hexStringToUIColor(hex: "#666687")

        guard let customFont = UIFont(name: "Mulish-SemiBold", size: 16) else {
            fatalError("""
                Failed to load the "Mulish-SemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true

        return label
    }()
    
    private lazy var textField : UITextField = {
        let textField = UITextField()
        
        textField.layer.cornerRadius = 16
        textField.placeholder = "Ex: Don't add onion"
//        textField.placeholderRect(forBounds: CGRect(x: 30, y: 5, width: 295, height: 18))
//        textField.placeholderRect(forBounds: CGRect(x: 40, y: 5, width: 200, height: 16))
        
        textField.backgroundColor = .white
        
        textField.textAlignment = .center
        
        return textField
    }()
    
    
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        
        //MARK: Adding subviews
        self.view.addSubview(self.generalScrollView)
        self.generalScrollView.addSubview(self.headerView)
        self.generalScrollView.addSubview(self.ratingView)
        self.generalScrollView.addSubview(self.dishView)
        self.generalScrollView.addSubview(self.priceView)
        self.generalScrollView.addSubview(self.textView)
        self.generalScrollView.addSubview(self.stackView)

        self.weigths.forEach { instance in
            let productView = ProductWeightView()
            productView.setup(instance: instance)
            self.stackView.addArrangedSubview(productView)
        }

        self.generalScrollView.addSubview(self.ingredientLabel)
        self.generalScrollView.addSubview(self.collectionView)
        self.generalScrollView.addSubview(self.toppingLabel)
        self.generalScrollView.addSubview(self.tableView)
        self.generalScrollView.addSubview(self.requestLabel)
        self.generalScrollView.addSubview(self.textField)
////        self.generalStackView.addArrangedSubview(self.headerView)
////        self.generalStackView.addArrangedSubview(self.ratingView)
        
        
        //MARK: Constraints
        self.generalScrollView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
//        self.generalStackView.snp.makeConstraints { make in
//            make.top.equalTo(self.generalScrollView.contentLayoutGuide.snp.top)
//            make.left.equalTo(self.generalScrollView.contentLayoutGuide.snp.left)
//            make.bottom.equalTo(self.generalScrollView.contentLayoutGuide.snp.bottom)
//            make.centerX.equalTo(self.generalScrollView.snp.centerX)
//        }
        
        self.headerView.snp.makeConstraints { make in
            make.top.equalTo(self.generalScrollView.contentLayoutGuide.snp.top).offset(8)
            make.centerX.equalTo(self.generalScrollView.snp.centerX)
        }

        self.ratingView.snp.makeConstraints { make in
            make.top.equalTo(self.generalScrollView.contentLayoutGuide.snp.top).offset(22)
            make.left.equalTo(self.headerView.snp.right).offset(19)
        }
//
        self.dishView.snp.makeConstraints { make in
            make.top.equalTo(self.headerView.snp.bottom).offset(73)
            make.left.equalTo(self.generalScrollView.contentLayoutGuide.snp.left).offset(24)
        }
//
        self.priceView.snp.makeConstraints { make in
//            make.right.equalTo(self.generalScrollView.contentLayoutGuide.snp.right).offset(-24)
            make.centerY.equalTo(self.dishView.snp.centerY)
//            make.top.equalTo(self.headerView.snp.bottom).offset(73)
            make.left.equalTo(self.dishView.snp.right).offset(93)

        }
//
        self.textView.snp.makeConstraints { make in
            make.top.equalTo(self.priceView.snp.bottom).offset(12)
            make.left.equalTo(self.generalScrollView.contentLayoutGuide.snp.left).offset(24)
        }
//
        self.stackView.snp.makeConstraints { make in
            make.top.equalTo(self.textView.snp.bottom).offset(30)
            make.left.equalTo(self.generalScrollView.contentLayoutGuide.snp.left).offset(24)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-24)
            make.height.equalTo(58)
        }
//
        self.ingredientLabel.snp.makeConstraints { make in
            make.top.equalTo(self.stackView.snp.bottom).offset(30)
            make.left.equalTo(self.generalScrollView.contentLayoutGuide.snp.left).offset(24)
        }
//
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.ingredientLabel.snp.bottom).offset(12)
            make.left.equalTo(self.generalScrollView.contentLayoutGuide.snp.left).offset(24)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.height.equalTo(74)
        }
//
        self.toppingLabel.snp.makeConstraints { make in
            make.top.equalTo(self.collectionView.snp.bottom).offset(30)
            make.left.equalTo(self.generalScrollView.contentLayoutGuide.snp.left).offset(24)
        }
//
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.toppingLabel.snp.bottom).offset(12)
            make.left.equalTo(self.generalScrollView.contentLayoutGuide.snp.left).offset(24)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-24)
//            make.bottom.equalTo(self.generalScrollView.contentLayoutGuide.snp.bottom)
            make.height.equalTo(480)
            make.width.equalTo(414)
        }
        
        self.requestLabel.snp.makeConstraints { make in
            make.top.equalTo(self.tableView.snp.bottom).offset(18)
            make.left.equalTo(self.generalScrollView.contentLayoutGuide.snp.left).offset(24)
            make.height.equalTo(26)

//            make.bottom.equalTo(self.generalScrollView.contentLayoutGuide.snp.bottom)

        }
        
        self.textField.snp.makeConstraints { make in
            make.top.equalTo(self.requestLabel.snp.bottom).offset(12)
            make.left.equalTo(self.generalScrollView.contentLayoutGuide.snp.left).offset(24)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-24)
            make.bottom.equalTo(self.generalScrollView.contentLayoutGuide.snp.bottom)
            make.height.equalTo(82)

        }
    }
}

//MARK: Extension
//extension ViewController: UITableViewDataSource, UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.toppings.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: self.toppingCell) as! ToppingsTableViewcell
//        let toppingItem = toppings[indexPath.row]
//        cell.setup(topping: toppingItem)
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Add toppings"
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat(48)
//    }
//}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate{

    //MARK: CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.ingredients.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.ingredientCell, for: indexPath) as! IngredientCollectionViewCell
        let ingredientItem = self.ingredients[indexPath.row]
        cell.setup(ingredient: ingredientItem)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 92, height: 74)
    }
    

    //MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toppings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.toppingCell) as! ToppingsTableViewcell
        let toppingItem = toppings[indexPath.row]
        cell.setup(topping: toppingItem)
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 16
        cell.clipsToBounds = true
        return cell
    }

//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Add toppings"
//    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }
    
    
}

//MARK: Structs
struct ProductWeight {
    var number : Int
    var type : String
}

struct IngredientCellItems {
    var image : UIImageView
    var name: String
}

struct Topping {
    var name : String
    var price : Double
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


