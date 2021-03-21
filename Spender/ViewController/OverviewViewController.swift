//
//  OverviewViewController.swift
//  Spender
//
//  Created by Steve Harski on 3/19/21.
//

import UIKit

class OverviewViewController: UIViewController {
    
    // MARK: - @IBOutlet
    @IBOutlet weak var customNavBarView: UIView!
    
    // MARK: - ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - UI Functionality
    func setupCustomNavBar() {
        customNavBarView.addShadow()
        customNavBarView.addGradient(from: #colorLiteral(red: 0.8715779185, green: 0.9737123847, blue: 0.8044601083, alpha: 1), to: #colorLiteral(red: 0.5840260386, green: 0.6783261895, blue: 0.4990360141, alpha: 1), direction: .topLeftToBottomRight)
    }
}
