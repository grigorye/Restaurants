//
//  RestaurantDetailsViewController.swift
//  Pods
//
//  Created by Grigory Entin on 22/05/2019.
//

import UIKit

class DetailsViewController : UITableViewController, DetailsView {
    
    public var model: DetailsViewModel? {
        didSet {
            guard isViewLoaded else {
                return
            }
            self.updateForViewModel()
        }
    }
    
    private func updateForViewModel() {
        nameLabel.text = model?.name ?? ""
        let addressLines = model?.addressLines ?? []
        addressLineCells?.enumerated().forEach { (i, cell) in
            if i >= addressLines.count {
                cell.isHidden = true
            } else {
                cell.isHidden = false
                cell.textLabel?.text = addressLines[i]
            }
        }
        self.tableView.reloadData()
    }
    
    // MARK: -
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        updateForViewModel()
    }
    
    // MARK: -
    
    override public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.isHidden ?? false {
            return 0
        }
        
        return super.tableView(tableView, heightForRowAt: indexPath)
    }

    // MARK: -
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var addressLineCells: [UITableViewCell]?
}

extension DetailsViewController {
    
    public static func instantiatedFromStoryboard() -> DetailsViewController {
        let storyboardName = "Details"
        let bundle = Bundle(for: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        let viewController = storyboard.instantiateInitialViewController()
        return viewController as! DetailsViewController
    }
}
