//
//  CityCellView.swift
//  ThesisProjectVIPERExample
//
//  Created by Maciej Hełmecki on 24/12/2018.
//  Copyright © 2018 Maciej Hełmecki. All rights reserved.
//

import UIKit

public protocol CityCellViewDelegate: class {
    func cityCellViewDidTapNavigationButton(_ cell: CityCellView)
}

public class CityCellView: UITableViewCell {
    // MARK: - Public properties
    // swiftlint:disable private_outlet
    @IBOutlet public weak var cityNameLabel: UILabel!
    @IBOutlet public weak var tempLabel: UILabel!
    @IBOutlet public weak var iconImageView: UIImageView!
    
    weak public var delegate: CityCellViewDelegate?
    
    // MARK: - Init
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    // MARK: - Public methods
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction public func navigationButtonTapped(_ sender: Any) {
        delegate?.cityCellViewDidTapNavigationButton(self)
    }
    
    // MARK: - Private methods
    private func setupView() {
        self.selectionStyle = .none
    }
}
