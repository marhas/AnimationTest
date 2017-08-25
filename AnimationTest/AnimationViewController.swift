//
//  AnimationViewController.swift
//  AnimationTest
//
//  Created by Marcel Hasselaar on 2017-08-25.
//  Copyright © 2017 Qapital Insights AB. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController, CAAnimationDelegate {

    @IBOutlet weak var greenSquare: UIView!
    @IBOutlet weak var redSquare: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    deinit {
        print("AnimationViewController deinit")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        createBasicAnimation()

        createUIAnimation()
    }

    private func createBasicAnimation() {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi*2)
        rotateAnimation.duration = 2.0
        rotateAnimation.repeatCount = Float.greatestFiniteMagnitude
        rotateAnimation.delegate = self

        self.greenSquare.layer.add(rotateAnimation, forKey: "rotation")
    }

    private func createUIAnimation() {
        UIView.animate(withDuration: 2.0, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.redSquare.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }) { finished in
            print("Red square animation finished")
        }
    }

    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("Green square animation stopped")
    }
}
