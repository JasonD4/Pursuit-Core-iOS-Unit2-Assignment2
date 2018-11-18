//
//  DetailViewController.swift
//  GameOfThrones
//
//  Created by Jason on 11/17/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageUpload: UIImageView!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var seasonNumber: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var runTime: UILabel!
    @IBOutlet weak var airDate: UILabel!
    @IBOutlet weak var episodeDescribe: UITextView!
    var episodeData: GOTEpisode?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTheEpisodeInfo()

        // Do any additional setup after loading the view.
    }
    private func updateTheEpisodeInfo(){
        imageUpload.image = UIImage(named: (episodeData?.originalImageID)!)
        episodeName.text = episodeData?.name
        seasonNumber.text = "Season: \((episodeData?.season)!)"
        episodeNumber.text = "Episode: \((episodeData?.number)!)"
        runTime.text = "Runtime: \((episodeData?.runtime)!)"
        airDate.text = episodeData?.airdate
        episodeDescribe.text = episodeData?.summary
    }

}
