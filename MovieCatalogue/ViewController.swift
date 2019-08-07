//
//  ViewController.swift
//  MovieCatalogue
//
//  Created by Bill Tanthowi Jauhari on 06/08/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var listData: UITableView!
    var ourData = [String]()
    var dateData = [String]()
    var descriptionData = [String]()
    var rate = [Double]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ourData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var data = tableView.dequeueReusableCell(withIdentifier: "dataku") as! DataTableViewCell
        data.dataLabel.text = String(self.ourData[indexPath.row])
        data.dateLabel.text = String(self.dateData[indexPath.row])
        data.descriptionLabel.text = String(self.descriptionData[indexPath.row])
        data.popularityLabel.text = String(self.rate[indexPath.row])
        return data
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.themoviedb.org/3/discover/movie?primary_release_date.gte=2014-09-15&primary_release_date.lte=2014-10-22&api_key=d9e7626a26ff6d42d5e1282528ed6726")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        let jsonData = try JSONDecoder().decode(Discover.self, from: data!)
                        DispatchQueue.main.async {
                            for (index, result) in jsonData.results.enumerated() {
                                self.ourData.append(result.title)
                                self.dateData.append(result.release_date)
                                self.rate.append(result.vote_average)
                                self.descriptionData.append(self.trimDescriptionText(text: result.overview))
                            }
                            self.listData.reloadData()
                        }
                    }
                }
            } catch let jsonError {
                print(jsonError)
            }
        }
        
        task.resume()
        // Do any additional setup after loading the view.
    }
    
    private func trimDescriptionText(text: String) -> String
    {
        if text.count > 200 {
            let r = ..<text.index(text.startIndex, offsetBy: 200)
            return String(text[r])
        }
        return text
    }

}

