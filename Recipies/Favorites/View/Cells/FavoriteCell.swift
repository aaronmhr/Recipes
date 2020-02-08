//
//  FavoriteCell.swift
//  Recipies
//
//  Created by Aaron Huánuco on 08/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import UIKit
import Kingfisher

final class FavoriteCell: UITableViewCell, NibReusable {
    @IBOutlet private var recipeImage: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var ingredientsLabel: UILabel!
    @IBOutlet private var hasLactoseLabel: UILabel!
    
    func configure(with viewModel: RecipeViewModel) {
        recipeImage.kf.setImage(with: viewModel.image, placeholder: #imageLiteral(resourceName: "placeholder"))
        titleLabel.text = viewModel.name
        ingredientsLabel.text = viewModel.ingredients
        hasLactoseLabel.text = viewModel.hasLactose
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        recipeImage.image = nil
        titleLabel.text = nil
        ingredientsLabel.text = nil
        hasLactoseLabel.text = nil
    }
}
