//
//  MapButton.swift
//  Take Taxi
//
//  Created by Alireza Asadi on 27/4/1398 AP.
//  Copyright © 1398 AP Alireza Asadi. All rights reserved.
//

import UIKit

class MapButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        self.layer.cornerRadius = 6
    }

}
