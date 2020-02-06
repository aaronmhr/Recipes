//
//  RecipeCell.swift
//  Recipies
//
//  Created by Aaron Huánuco on 06/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import UIKit
import Kingfisher

final class RecipeCell: UICollectionViewCell, NibReusable {
    @IBOutlet private var recipeImage: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var favoritesButton: UIButton!
    @IBOutlet private var ingredientsLabel: UILabel!
    @IBOutlet private var hasLactoseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addShadowToCell()
        configureHighAVBLabel()
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
    
    func configure(with viewModel: RecipeViewModel) {
        recipeImage.kf.setImage(with: viewModel.image)
        titleLabel.text = viewModel.name
        ingredientsLabel.text = viewModel.ingredients
        favoritesButton.setTitle(viewModel.button, for: .normal)
        hasLactoseLabel.isHidden = viewModel.hasLactose == nil
        hasLactoseLabel.text = viewModel.hasLactose
    }
    
    private func addShadowToCell() {
        self.layer.cornerRadius = 6
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
    }
    
    private func configureHighAVBLabel() {
        hasLactoseLabel.transform = CGAffineTransform(rotationAngle: 45 * CGFloat.pi / 180)
    }
}