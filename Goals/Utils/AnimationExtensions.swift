//
//  AnimationExtensions.swift
//  Goals
//
//  Created by Abanoub Ashraf on 01/12/2023.
//

import SwiftUI

extension Animation {
    func `repeat`(while expression: Bool, autoreverse: Bool = true) -> Animation {
        if expression {
            return self.repeatForever(autoreverses: autoreverse)
        } else {
            return self
        }
    }
}
