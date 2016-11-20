//
//  ModalViewController.swift
//  FeatureFlagDemo
//
//  Created by Jacky Wu on 11/19/16.
//  Copyright © 2016 Jacky Wu. All rights reserved.
//

import UIKit
import Leanplum

class ModalViewController: UIViewController {

    @IBOutlet weak var dismissButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dismissButton.addTarget(self, action: #selector(ModalViewController.dismiss), forControlEvents: .TouchUpInside)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func dismiss() {
    self.presentingViewController?.dismissViewControllerAnimated(true) {
      Leanplum.track("modal view dismissed")
    }
  }
}
