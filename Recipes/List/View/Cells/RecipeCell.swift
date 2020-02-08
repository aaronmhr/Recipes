//
//  RecipeCell.swift
//  Recipes
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
    
    private var index = 0
    private weak var delegate: FavoritesSelectorDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addShadowToCell()
        configureHasLactoseLabel()
        configureFavoriteButton()
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
    
    func configure(with viewModel: RecipeViewModel, delegate: FavoritesSelectorDelegate, index: Int) {
        self.delegate = delegate
        self.index = index
        recipeImage.kf.setImage(with: viewModel.image, placeholder: #imageLiteral(resourceName: "placeholder"))
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
    
    private func configureHasLactoseLabel() {
        hasLactoseLabel.transform = CGAffineTransform(rotationAngle: 45 * CGFloat.pi / 180)
    }
    
    private func configureFavoriteButton() {
        favoritesButton.layer.borderWidth = 1.0
        favoritesButton.layer.cornerRadius = 15.0
        favoritesButton.layer.borderColor = #colorLiteral(red: 0, green: 0.4980392157, blue: 1, alpha: 1)
    }
    
    @IBAction func favoritesButtonTapped(_ sender: UIButton) {
        delegate?.didSelectFavoriteAtIndex(index)
    }
}
