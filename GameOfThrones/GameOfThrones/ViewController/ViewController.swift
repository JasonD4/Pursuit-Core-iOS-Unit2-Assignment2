//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit
// need a [1][10][2][10]
class ViewController: UIViewController {
    @IBOutlet weak var episodeCells: UITableView!
    private var season = [[GOTEpisode]]()
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
    season = [GOTEpisode.allEpisodes]
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
// good to go

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return gottenEpisode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cells = HowTheTableLooks()
        if gottenEpisode[indexPath.row].season % 2 == 1{
        let episode = gottenEpisode[indexPath.row]
        guard let cells = tableView.dequeueReusableCell(withIdentifier: "EpisodeHolder", for: indexPath ) as? HowTheTableLooks else{ fatalError()}
        cells.CellImage?.image = UIImage(named: episode.mediumImageID)
        cells.EpisodeName?.text = episode.name
        cells.SeasonEpisode?.text = " Season: \(episode.season) Episode: \(episode.number)"

        
        return cells
    }
        else {
                let episode = gottenEpisode[indexPath.row]
                
                guard let cells = tableView.dequeueReusableCell(withIdentifier: "EpisodeHolderEven", for: indexPath ) as? EvenHowTheTableLooks else{ fatalError()}
                cells.evenImage?.image = UIImage(named: episode.mediumImageID)
                cells.EvenLabel?.text = episode.name
                cells.EvenSeason?.text = " Season: \(episode.season) Episode: \(episode.number)"
                
            return cells

        }

    }
  
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return gottenEpisode.count / 10
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    
    switch section {
    case 0:
    return "Season 1"
    case 1:
    return "Season 2"
    case 2:
    return "Season 3"
    case 3:
    return "Season 4"
    case 4:
    return "Season 5"
    case 5:
    return "Season 6"
    case 6:
    return "Season 7"
    default:
    return "Unknown"
    }
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
//extension ViewController: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //this function sets up how many rows the table view has it needs to return that number
//
//        return GOTEpisode.allEpisodes[section].season
//
//}
//}


