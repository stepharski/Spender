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

    @IBOutlet weak var incomeAmountLabel: UILabel!
    @IBOutlet weak var expensesAmountLabel: UILabel!
    @IBOutlet weak var balanceAmountLabel: UILabel!
    
    @IBOutlet weak var categoriesButton: UIButton!
    @IBOutlet weak var listButton: UIButton!
    
    // MARK: - Properties
    fileprivate lazy var constants = Constants()
    
    // MARK: - @IBAaction
    @IBAction func selectCategoriesView(_ sender: UIButton) {
        updateCategoriesListButtons(for: sender)
    }
    
    @IBAction func selectListView(_ sender: UIButton) {
        updateCategoriesListButtons(for: sender)
    }
    
    // MARK: - ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - UI Helpers
    func setupUI() {
        setupCustomNavBar()
        updateCategoriesListButtons(for: listButton)
    }
    
    func setupCustomNavBar() {
        customNavBarView.addShadow()
        customNavBarView.addGradient(from: constants.gradientStartColor,
                                     to: constants.gradientEndColor,
                                     direction: constants.gradientDirection)
        categoriesButton.layer.cornerRadius = categoriesButton.frame.height * 0.5
        listButton.layer.cornerRadius = listButton.frame.height * 0.5
    }
    
    func updateCategoriesListButtons(for button: UIButton) {
        categoriesButton.isSelected = button == categoriesButton
        listButton.isSelected = button == listButton
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            self.categoriesButton.backgroundColor = self.categoriesButton.isSelected
                ? self.constants.selectedButtonColor
                : self.constants.unselectedButtonColor
            self.listButton.backgroundColor = self.listButton.isSelected
                ? self.constants.selectedButtonColor
                : self.constants.unselectedButtonColor
        }
    }
}

// MARK: - Constants
fileprivate extension OverviewViewController {
    struct Constants {
        let gradientStartColor = #colorLiteral(red: 0.8715779185, green: 0.9737123847, blue: 0.8044601083, alpha: 1)
        let gradientEndColor = #colorLiteral(red: 0.5840260386, green: 0.6783261895, blue: 0.4990360141, alpha: 1)
        let gradientDirection = GradientDirection.topLeftToBottomRight
        
        let selectedButtonColor = #colorLiteral(red: 0.9490196078, green: 1, blue: 0.9333333333, alpha: 1)
        let unselectedButtonColor = #colorLiteral(red: 0.7882352941, green: 0.8588235294, blue: 0.7333333333, alpha: 1)
    }
}
