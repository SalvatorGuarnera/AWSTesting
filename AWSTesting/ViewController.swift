//
//  ViewController.swift
//  AWSTesting
//
//  Created by Salvator Guarnera on 5/29/20.
//  Copyright © 2020 Spiralus, LLC. All rights reserved.
//

import UIKit
import AWSAuthCore
import AWSAuthUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        showSignIn()
    }
    
    func showSignIn(){
        
        
        
        if !AWSSignInManager.sharedInstance().isLoggedIn{
            AWSAuthUIViewController
                .presentViewController(with: self.navigationController!, configuration: nil) { (provider, error) in
                    if error != nil{
                        print("Error occured: ", error.debugDescription)
                    }else{
                        print("Logged in with provider: \(provider.identityProviderName) with token \(provider.token())")
                        if let nav = self.navigationController{
                            if let vc = self.storyboard!.instantiateViewController(withIdentifier: "PostSignIn") as? PostSignInPage{
                                nav.pushViewController(vc, animated: true)
                            }
                        }
                    }
            }
        }
        
    }


}

