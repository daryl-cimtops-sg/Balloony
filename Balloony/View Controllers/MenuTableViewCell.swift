//
//  MenuTableViewCell.swift
//  Balloony
//
//  Created by Daryl Gialolo on 20/8/24.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Fonts.quicksandMedium.value, size: 24)
        label.textColor = .init(Colors.primary.color)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        contentView.addSubview(titleLabel)
        
        // Setup constraints for titleLabel
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        // Initial setup for cell appearance
        backgroundColor = .clear
        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = UIColor(Colors.primary.color).withAlphaComponent(0.05)
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
    
    func updateColor(_ selected: Bool) {
        if selected {
            titleLabel.layer.opacity = 1
        } else {
            titleLabel.layer.opacity = 0.25
        }
    }
}

