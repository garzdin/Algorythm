//
//  ViewController.swift
//  Algorythm
//
//  Created by Teodor on 09/02/16.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit

class PlaylistMasterViewController: UIViewController {
    
    var playlistsArray: [UIImageView] = []
    @IBOutlet weak var playlistImageView0: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playlistsArray.append(playlistImageView0)
        
        for index in 0..<playlistsArray.count {
            let playlist = Playlist(index: index)
            let playlistImageView = playlistsArray[index]
            
            playlistImageView.image = playlist.icon
            playlistImageView.backgroundColor = playlist.backgroundColor
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPlaylistDetailSegue" {
            if let playlistImageView = sender!.view! as? UIImageView {
                if let index = playlistsArray.index(of: playlistImageView) {
                    if let playlistDetailViewController = segue.destinationViewController as? PlaylistDetailViewController {
                        playlistDetailViewController.playlist = Playlist(index: index)
                    }
                }
            }
        }
    }
    
    @IBAction func showPlaylistDetail(_ sender: AnyObject) {
        performSegue(withIdentifier: "showPlaylistDetailSegue", sender: sender)
    }
}

