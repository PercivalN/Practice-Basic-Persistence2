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

	// MARK: - Persistence
	// This is a computed property, so everytime it is called it runs the code.
	private var persistentFileURL: URL? {
		let fm = FileManager.default
		guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		return dir.appendingPathComponent("stars.plist")
	}

	// Persistent has 2 methods: Read the data and save the data
	private func loadFromPersistentStore() {
		let fm = FileManager.default
		guard let url = persistentFileURL,
			fm.fileExists(atPath: url.path) else { return }

		// The do try catch is a form of error handling
		do {
			let data = try Data(contentsOf: url) // anything that can throw an error you have to put try in front of it. In this case, Data can throw an error.
			let decoder = PropertyListDecoder()
			stars = try decoder.decode([Star].self, from: data)
		} catch {
			NSLog("Error loading stars data: \(error)")
		}
	}

	private func saveToPersistentStore() {
		guard let url = persistentFileURL else { return }

		do {
			let encoder = PropertyListEncoder()
			let data = try encoder.encode(stars)
			try data.write(to: url)
		} catch {
			NSLog("Error loading stars data: \(error)")
		}
	}
}

