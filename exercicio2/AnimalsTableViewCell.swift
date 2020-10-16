//
//  AnimalsTableViewCell.swift
//  exercicio2
//
//  Created by Paola Pagotto on 06/10/2020.
//  Copyright © 2020 Paola Pagotto. All rights reserved.
//

import UIKit

class AnimalsTableViewCell: UITableViewCell {

    @IBOutlet weak var imageAnimal: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelBreed: UILabel!
    
    @IBOutlet weak var labelSpecie: UILabel!
    
    @IBOutlet weak var labelNet: UILabel!
    
    func setup(animal: Animal) {
        labelName.text = animal.name
        labelBreed.text = animal.breed
        labelSpecie.text = animal.specie
        labelNet.text = animal.net
        imageAnimal.image = UIImage(named: animal.image)

        imageAnimal.layer.cornerRadius = imageAnimal.frame.size.width / 2
        imageAnimal.clipsToBounds = true
        imageAnimal.layer.masksToBounds = true
        imageAnimal.layer.borderColor = UIColor.gray.cgColor
        imageAnimal.layer.borderWidth = 0.2
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
