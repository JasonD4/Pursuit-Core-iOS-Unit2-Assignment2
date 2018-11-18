//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var episodeCells: UITableView!
    private var gottenEpisode = [GOTEpisode](){
        // property observing
        didSet {
            // reload table view
            episodeCells.reloadData()
        }
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    gottenEpisode = GOTEpisode.allEpisodes
    episodeCells.dataSource = self
    episodeCells.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = episodeCells.indexPathForSelectedRow,
             let DetailViewController = segue.destination as? DetailViewController else { return }
        let episode = gottenEpisode[indexPath.row]
        
        DetailViewController.episodeData = episode
    }
}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gottenEpisode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cells = tableView.dequeueReusableCell(withIdentifier: "EpisodeHolder", for: indexPath) as? HowTheTableLooks else{ fatalError()}
        
        let episode = gottenEpisode[indexPath.row]
        cells.CellImage?.image = UIImage(named: episode.mediumImageID)
        cells.EpisodeName?.text = episode.name
        cells.SeasonEpisode?.text = " Season: \(episode.season) Episode: \(episode.number)"
        
        
        return cells
    }
    
    
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
