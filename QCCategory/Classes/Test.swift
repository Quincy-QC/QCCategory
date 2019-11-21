//
//  Category.swift
//  ebeiben
//
//  Created by Quincy-QC on 2019/9/9.
//  Copyright © 2019 Quincy-QC. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentAlertController2(_ viewControllerToPresent: UIViewController, _ completion: (() -> Void)? = nil) {
        present(viewControllerToPresent, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                viewControllerToPresent.dismiss(animated: true)
                if let completion = completion {
                    completion()
                }
            })
        }
    }
}

