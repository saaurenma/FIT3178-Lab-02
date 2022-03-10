//
//  WeatherDetails.swift
//  FIT3178-W02-Lab
//
//  Created by Saauren Mankad on 10/3/2022.
//

import Foundation
import CoreGraphics
import UIKit

enum WeatherIcon {
    case sun
    case clouds
    case rain
    case lightning
    case snow
}

struct WeatherDetails {
    
    var description: String
    var backgroundColour: CGColor?
    var icon: WeatherIcon
}

func iconImageName(icon:WeatherIcon) -> String {
    
    switch icon {
        case .clouds:
            return "cloud.fill"
        case .rain:
            return "cloud.rain.fill"
        case .lightning:
            return "cloud.bolt.fill"
        case .snow:
            return "cloud.snow.fill"
        default:
            return "sun.max.fill"
        
        }

    }


