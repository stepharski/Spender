//
//  MainTabBar.swift
//  Spender
//
//  Created by Steve Harski on 3/19/21.
//

import UIKit

class MainTabBar: UITabBar {

    private var middleButton = UIButton()
    
    // MARK: - Constants
    private let addButtonImage = #imageLiteral(resourceName: "addButtonTabBar")
    private let tabBarBackgroundColor = #colorLiteral(red: 0.9852560163, green: 0.9898150563, blue: 1, alpha: 1)
    private let selectedBarButtonColor = #colorLiteral(red: 0.1854634285, green: 0.4102962017, blue: 0.2224472463, alpha: 1)
    private let unselectedBarButtonColor = #colorLiteral(red: 0.3989664614, green: 0.4103312194, blue: 0.4143762589, alpha: 1)
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTabBar()
        setupMiddleButton()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.isHidden {
            return super.hitTest(point, with: event)
        }
        
        let from = point
        let to = middleButton.center
        
        return sqrt((from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)) <= 39 ? middleButton : super.hitTest(point, with: event)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        middleButton.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: 0)
    }
    
    // MARK: - Functionality
    func setupTabBar() {
        tintColor = selectedBarButtonColor
        unselectedItemTintColor = unselectedBarButtonColor
        barTintColor = tabBarBackgroundColor
    }
    
    func setupMiddleButton() {
        middleButton.frame.size = CGSize(width: 70, height: 70)
        middleButton.layer.cornerRadius = 35
        middleButton.setImage(addButtonImage, for: .normal)
        middleButton.layer.masksToBounds = true
        middleButton.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: 0)
        middleButton.addTarget(self, action: #selector(test), for: .touchUpInside)
        addSubview(middleButton)
    }
    
    // TODO: - Present AddItemVC
    @objc func test() {
        print("add button is pressed")
    }
}
