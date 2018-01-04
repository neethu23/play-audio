//
//  ViewController.swift
//  back to bach
//
//  Created by Somasekharan, Neethu on 6/15/16.
//  Copyright © 2016 neethu. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()

    
    @IBAction func play(sender: AnyObject) {
        
        player.play()
    }
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
    }
    @IBAction func stop(sender: AnyObject) {
        
        player.pause()
        do{
            
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "bach", ofType: "mp3")!) as URL)
            
        }catch{
            
            // it didn't work
        }
        
    }
    @IBOutlet weak var volume: UISlider!
    @IBOutlet weak var scrub: UISlider!
    @IBAction func volumeSlider(sender: AnyObject) {
        
        player.volume = volume.value
    }
    @IBAction func scrubSlider(sender: AnyObject) {
        
        player.currentTime = TimeInterval(scrub.value)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("updateScrub"), userInfo: nil, repeats: true)
        
        do{
            
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "bach", ofType: "mp3")!) as URL)
            scrub.maximumValue = Float(player.duration)
        
        }catch{
            
            // it didn't work
        }
        
    }
    
    func updateScrub(){
    
        scrub.value = Float(player.currentTime)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

