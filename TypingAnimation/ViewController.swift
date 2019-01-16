//
//  ViewController.swift
//  TypingAnimation
//
//  Created by Damodar Shenoy on 5/13/18.
//  Copyright © 2018 itscoderslife. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animatingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        animatingLabel.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animateAppName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animateAppName() {
        animatingLabel.text = ""
        
        let appName = (Bundle.main.infoDictionary?["CFBundleName"] as? String) ??  "itscoderslife();"

        // New code using Timer class
        
        let characters = appName.map { $0 }
        var index = 0
        Timer.scheduledTimer(withTimeInterval: 0.12, repeats: true, block: { [weak self] timer in
            if index < appName.count {
                let char = characters[index]
                self?.animatingLabel.text! += "\(char)"
                index += 1
            } else {
                timer.invalidate()
            }
        })

        /**

        // Older Code using Run loop to block the UI

        for char in appName {
            animatingLabel.text! += "\(char)"
            RunLoop.current.run(until: Date()+0.12)
        }

        */

    }
}

