//
//  StarController.swift
//  Stars
//
//  Created by Percy Ngan on 12/9/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//

import Foundation

// Storing data on dish should be taken up by a model controller
class StarController {

	private(set) var stars: [Star] = []

	@discardableResult func createStar(named name: String, withDistance distance: Double) -> Star {
		let star = Star(name: name, distance: distance)
		stars.append(star)
		return star
	}
}
