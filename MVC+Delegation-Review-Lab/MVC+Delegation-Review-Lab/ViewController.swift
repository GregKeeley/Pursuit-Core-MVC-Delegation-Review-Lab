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
    
    var movies = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }
    var fontSize = CGFloat()
    var fontSizeDelegate = FontSize()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
        fontSizeDelegate.delegate = self
    }
    
    func loadData() {
        movies = Movie.allMovies
        
    }
    @IBAction func fontSizeChange(segue: UIStoryboardSegue) {
        guard let movieViewController = segue.source as? SettingsViewController else {
            fatalError("Unwind segue error")
        }
        fontSize = CGFloat(movieViewController.fontSize)
        loadData()
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
    let movie = movies[indexPath.row]
    cell.textLabel?.font = UIFont.systemFont(ofSize: fontSize)
    cell.textLabel?.text = movie.name
    cell.detailTextLabel?.text = movie.year.description
    cell.imageView?.image = UIImage(named: movie.posterImageName.description)
    return cell
    }

}
extension ViewController: FontSizeDelegate {
    func changeFontSize() {
        
    }
    
    
}
