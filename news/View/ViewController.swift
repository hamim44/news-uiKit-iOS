//
//  ViewController.swift
//  news
//
//  Created by Abrar Hamim on 27/7/24.
//

import UIKit

class ViewController: UIViewController {
    


    @IBOutlet weak var tableView: UITableView!
    var newsdata = [Post]()
    let apidelegate = Apidelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        apidelegate.fatchData {[weak self] Posts in
            self?.newsdata = Posts
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell
        let post = newsdata[indexPath.row]
        cell?.newsID.text = ("\(post.points)")
        cell?.newstitle.text = post.title
        return cell!
    }

    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = newsdata[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        if let vc = storyboard.instantiateViewController(withIdentifier: "newsviewController") as? newsController {
            vc.urlString = post.url
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
