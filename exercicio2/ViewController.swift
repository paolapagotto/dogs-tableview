//
//  ViewController.swift
//  exercicio2
//
//  Created by Paola Pagotto on 06/10/2020.
//  Copyright © 2020 Paola Pagotto. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    
    
    @IBOutlet weak var searchBarAnimals: UISearchBar!
    
    @IBOutlet weak var tableViewAnimals: UITableView!
    
    
    var arrayAnimals = [Animal]()
    var searchAnimal = [Animal]()
    var searching = false
    
    
    let animal1 = Animal(name: "Chopp", breed: "Golden Retriever", specie: "Dog", net: "45 kg", image: "1.png")
    let animal2 = Animal(name: "Meow", breed: "Breed", specie: "Cat", net: "3 kg", image: "2.png")
    let animal3 = Animal(name: "Atila", breed: "Fila", specie: "Dog", net: "15 kg", image: "3.png")
    let animal4 = Animal(name: "Steve", breed: "Chowchow", specie: "Dog", net: "5 kg", image: "4.png")
    let animal5 = Animal(name: "Annie", breed: "Corbie", specie: "Dog", net: "8 kg", image: "5.png")
    let animal6 = Animal(name: "Bruce", breed: "French Bulldog", specie: "Dog", net: "10 kg", image: "6.png")
    let animal7 = Animal(name: "Scooby", breed: "French Bulldog", specie: "Dog", net: "7 kg", image: "7.png")
    let animal8 = Animal(name: "Vlad", breed: "Labrador", specie: "Dog", net: "7.5 kg", image: "8.png")
    let animal9 = Animal(name: "Grumpy", breed: "Grumpy Cat", specie: "Cat", net: "9 kg", image: "9.png")
    let animal10 = Animal(name: "Benjamin", breed: "Gray Cat", specie: "Cat", net: "4.8 kg", image: "10.png")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarAnimals.delegate = self
//        searchBarAnimals.= self
        
        tableViewAnimals.delegate = self
        tableViewAnimals.dataSource = self
        
        
        arrayAnimals.append(animal1)
        arrayAnimals.append(animal2)
        arrayAnimals.append(animal3)
        arrayAnimals.append(animal4)
        arrayAnimals.append(animal5)
        arrayAnimals.append(animal6)
        arrayAnimals.append(animal7)
        arrayAnimals.append(animal8)
        arrayAnimals.append(animal9)
        arrayAnimals.append(animal10)
    }
}


extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let animal = arrayAnimals[indexPath.row].name
        print(animal)
        
    }
}

extension ViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        arrayAnimals.remove(at: indexPath.row)
        tableViewAnimals.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchAnimal.count
        }
        return arrayAnimals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as! AnimalsTableViewCell
        if searching {
            cell.setup(animal: searchAnimal[indexPath.row])
            return cell
        }
        cell.setup(animal: arrayAnimals[indexPath.row])
        return cell
    }
}

extension ViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBarAnimals.text ?? "Not found")
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText:String)
    {
        searchAnimal = arrayAnimals.filter({
            $0.name.contains(searchText)
        })
        searching = true
        tableViewAnimals.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        
        return tableViewAnimals.reloadData()
    }
    
}

extension ViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField,
        shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(searchBarAnimals.text ?? "Not found")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        searching = false
        tableViewAnimals.reloadData()
    }
    
}

