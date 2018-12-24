//
//  MainTableViewCell.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

import UIKit

public protocol MainTableViewCellDelegate: class {
    func mainTableViewCellDidTapNavigationButton(_ cell: MainTableViewCell)
}

public class MainTableViewCell: UITableViewCell {
    // Properties
    // swiftlint:disable private_outlet
    @IBOutlet public weak var cityNameLabel: UILabel!
    @IBOutlet public weak var tempLabel: UILabel!
    @IBOutlet public weak var iconImageView: UIImageView!
    
    weak public var delegate: MainTableViewCellDelegate?
    
    // Init
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // Public methods
    @IBAction public func navigationButtonTapped(_ sender: Any) {
        delegate?.mainTableViewCellDidTapNavigationButton(self)
    }
    
    // Private methods
    private func setupView() {
        self.selectionStyle = .none
    }
}
