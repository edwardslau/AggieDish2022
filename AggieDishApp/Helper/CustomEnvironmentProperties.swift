//
//  CustomEnvironmentProperties.swift
//  AggieDish
//
//  Created by Ruiyi He on 2/5/22.
//

import Foundation
import SwiftUI

struct DefaultPresentationKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(false)
    
}

extension EnvironmentValues {
    var defaultPresentation: Binding<Bool> {
        get{
            self[DefaultPresentationKey.self]
        }
        set {
            self[DefaultPresentationKey.self] = newValue
        }
    }
}
