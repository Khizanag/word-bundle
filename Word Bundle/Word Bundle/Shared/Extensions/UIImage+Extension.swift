//
//  UIImage+Extension.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 05.09.22.
//

import UIKit

extension UIImage {
    static func load(url: String) -> UIImage {
        do {
            guard let url = URL(string: url) else { return UIImage() }
            
            let data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
        
        } catch { }
        
        return UIImage()
    }
}
