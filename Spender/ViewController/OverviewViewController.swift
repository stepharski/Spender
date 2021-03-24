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
    
    @IBOutlet weak var timelinePickerView: UIView!
    @IBOutlet weak var timelinePickerLabel: UILabel!
    
    // MARK: - Properties
    fileprivate lazy var constants = Constants()
    
    // MARK: - @IBAaction
    @IBAction func selectCategoriesView(_ sender: UIButton) {
        updateCategoriesListButtons(for: sender)
    }
    
    @IBAction func selectListView(_ sender: UIButton) {
        updateCategoriesListButtons(for: sender)
    }
    
    @IBAction func showPreviousTimeline(_ sender: UIButton) {
    }
    
    
    @IBAction func showNextTimeline(_ sender: UIButton) {
    }
    
    // MARK: - ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
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
        configureTimelineView()
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
    
    func configureTimelineView() {
        timelinePickerView.addRoundedShadow()
        timelinePickerView.layer.cornerRadius = timelinePickerView.frame.height * 0.5
    }
}

// MARK: - Constants
fileprivate extension OverviewViewController {
    struct Constants {
        let gradientStartColor = #colorLiteral(red: 0.8715779185, green: 0.9737123847, blue: 0.8044601083, alpha: 1)
        let gradientEndColor = #colorLiteral(red: 0.5840260386, green: 0.6783261895, blue: 0.4990360141, alpha: 1)
        let gradientDirection = GradientDirection.topLeftToBottomRight
        
        let selectedButtonColor = #colorLiteral(red: 0.9490196078, green: 1, blue: 0.9333333333, alpha: 1)
        let unselectedButtonColor = #colorLiteral(red: 0.8309813142, green: 0.9030581117, blue: 0.7770924568, alpha: 1)
    }
}
