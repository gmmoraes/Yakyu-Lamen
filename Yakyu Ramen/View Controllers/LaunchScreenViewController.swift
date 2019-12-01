//
//  LaunchScreenViewController.swift
//  Yakyu Ramen
//
//  Created by Gabriel on 12/9/18.
//  Copyright © 2018 Gabriel. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    @IBOutlet weak var logoAppImg: UIImageView!
    @IBOutlet weak var hface: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AnimateBackgroundHeight()
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
    }
    
    @objc func timeToMoveOn() {
        self.performSegue(withIdentifier: "goToTeamPage", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initHFace() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.hface.isHidden = false
        }
    }
    func AnimateBackgroundHeight() {
        UIView.animate(withDuration: 2, animations: {
            self.logoAppImg.transform = CGAffineTransform.init(scaleX: 1.1, y: 1.1)
        }, completion: nil)
        initHFace()
    }

}
