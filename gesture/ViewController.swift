//
//  ViewController.swift
//  gesture
//
//  Created by jiang on 2018/11/19.
//  Copyright © 2018年 2016110433. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func addLable(_ sender: UIButton) {
        let x=Int(arc4random())%Int(view.bounds.width)
        let y=Int(arc4random())%Int(view.bounds.height)
    let label = UILabel(frame: CGRect(x: x, y: y, width: 30, height: 30))
        label.text="A"
        label.backgroundColor=UIColor.red
        label.textAlignment = .center
        label.layer.shadowColor=UIColor.gray.cgColor
        label.layer.shadowOffset=CGSize(width: 5, height: 5)
        label.layer.shadowOpacity=1
        let panRecognizer=UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        label.addGestureRecognizer(panRecognizer)
        let tagRecognizer=UITapGestureRecognizer(target: self, action: #selector(tag(recognizer:)))
        label.addGestureRecognizer(tagRecognizer)
        tagRecognizer.numberOfTapsRequired=1
        tagRecognizer.numberOfTouchesRequired=2
        let pinchRecognizer=UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer:)))
        label.addGestureRecognizer(pinchRecognizer)
        let rotationRecoginzer=UIRotationGestureRecognizer(target: self, action: #selector(rotation(recoginzer:)))
        label.addGestureRecognizer(rotationRecoginzer)
        label.isUserInteractionEnabled=true
        view.addSubview(label)
    }
    @objc func  pan(recognizer:UIPanGestureRecognizer)
    {
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation=recognizer.translation(in: self.view)
            recognizer.view?.center.x+=translation.x
            recognizer.view?.center.y+=translation.y
            recognizer.setTranslation(.zero, in: self.view)
        default:
            break
        }
    }
    
    @objc func tag(recognizer:UITapGestureRecognizer)
    {
        switch recognizer.state {
        case .recognized:
            recognizer.view?.removeFromSuperview()
        default:
            break
        }
    }
    @objc func pinch(recognizer:UIPinchGestureRecognizer)
    {
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            recognizer.view?.bounds=CGRect(x: 0, y: 0, width: (recognizer.view?.bounds.width)!*recognizer.scale, height: (recognizer.view?.bounds.height)!*recognizer.scale)
            recognizer.scale=1
        default:
            break
        }
    }
    @objc func rotation(recoginzer:UIRotationGestureRecognizer)
    {
        let rotation=recoginzer.rotation
        recoginzer.view?.transform=(recoginzer.view?.transform.rotated(by:rotation))!
        recoginzer.rotation=0
    }
    @IBAction func moveLable(_ sender: UIButton) {
        for lable in view.subviews
        {
            if lable is UILabel
            {
                UIView.animate(withDuration:1)
                {
                    let x=Int(arc4random())%Int(self.view.bounds.width)
                    let y=Int(arc4random())%Int(self.view.bounds.height)
                    lable.center.x=CGFloat(x)
                    lable.center.y=CGFloat(y)
                }
             
            }
        }
    }
    @IBAction func deleteLable(_ sender: UIButton) {
        for lable in view.subviews
        {
            if lable is UILabel
            {
                lable.removeFromSuperview()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

