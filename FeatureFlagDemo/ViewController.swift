//
//  ViewController.swift
//  FeatureFlagDemo
//
//  Created by Jacky Wu on 11/19/16.
//  Copyright © 2016 Jacky Wu. All rights reserved.
//

import UIKit
import Leanplum

let FeatureButtonText = "FeatureButtonText"
let FeatureButtonConfiguration = "FeatureButtonConfiguration"
let FeatureMarketingImage = "FeatureMarketingImage"

class ViewController: UIViewController {
  
  var alternateButtonConfigurationPVar = LPVar.define(FeatureButtonConfiguration, withBool: false)
  var alternateButtonText = LPVar.define(FeatureButtonText, withString: "My first button")
  var alternateMarketingImageLPVar = LPVar.define(FeatureMarketingImage, withBool: false)
  
  var button: UIButton?

  override func viewDidLoad() {
    super.viewDidLoad()
    initButton()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func initButton() {
    let frame = CGRectMake(view.center.x/2, view.center.y, 200, 50)
    let titleText = alternateButtonText.stringValue()
    button = UIButton(type: .Custom)
    button?.frame = frame
    button?.backgroundColor = UIColor.grayColor()
    button?.setTitle(titleText, forState: .Normal)
    button?.addTarget(self, action: #selector(ViewController.buttonCliecked), forControlEvents: .TouchUpInside)
    
    if alternateButtonConfigurationPVar.boolValue() {
      /* alternative button text */
      button?.backgroundColor = UIColor.blueColor()
    } else {
      /* default button text */
      button?.backgroundColor = UIColor.redColor()
    }
    self.view.addSubview(button!)
  }
  
  func buttonCliecked() {
    var image = UIImage(named: "Image1")
    if alternateMarketingImageLPVar.boolValue() {
      image = UIImage(named: "Image2")
    }

    let imageView = UIImageView(image: image)
    let newViewController = instantiateNewViewController()
    newViewController.view.addSubview(imageView)
    imageView.center = newViewController.view.center
    
    presentViewController(newViewController, animated: true) {
      Leanplum.track("button cliecked with")
    }
  }
  
  func instantiateNewViewController() -> UIViewController {
    let storyboardName = "Main";
    let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
    return storyboard.instantiateViewControllerWithIdentifier("modalViewController")
  }
}





