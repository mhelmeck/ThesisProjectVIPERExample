//
//  CityViewCell.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

import UIKit

public protocol CityViewCellDelegate: class {
    func cityViewCellDidTapNavigationButton(_ cell: CityViewCell)
}

public class CityViewCell: UITableViewCell {
    // Properties
    // swiftlint:disable private_outlet
    @IBOutlet public weak var cityNameLabel: UILabel!
    @IBOutlet public weak var tempLabel: UILabel!
    @IBOutlet public weak var iconImageView: UIImageView!
    
    weak public var delegate: CityViewCellDelegate?
    
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
        delegate?.cityViewCellDidTapNavigationButton(self)
    }
    
    // Private methods
    private func setupView() {
        self.selectionStyle = .none
    }
}
