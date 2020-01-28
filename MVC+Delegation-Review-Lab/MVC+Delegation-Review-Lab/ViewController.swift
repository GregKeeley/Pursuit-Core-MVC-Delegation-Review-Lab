//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]()
    var currentFontSize: CGFloat? = 17 {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
        tableView.delegate = self
//        settingsDelegate.fontSizeDelegate = self
    }
    
    func loadData() {
        movies = Movie.allMovies
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else {
            fatalError("Failed to segue from settingsVC")
        }
        settingsVC.fontSizeDelegate = self
        settingsVC.currentFontSize = currentFontSize!
    }
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
    let movie = movies[indexPath.row]
    cell.textLabel?.text = movie.name
    cell.detailTextLabel?.text = movie.year.description
    cell.textLabel?.font = UIFont(name: "Didot", size: currentFontSize ?? 17)
    cell.imageView?.image = UIImage(named: movie.posterImageName.description)
    return cell
    }

}
extension ViewController: UITableViewDelegate {
    
}
extension ViewController: FontSizeDelegate {
    func changeFontSize(_ fontSize: CGFloat) {

        self.currentFontSize = fontSize
    }
    
    
}
