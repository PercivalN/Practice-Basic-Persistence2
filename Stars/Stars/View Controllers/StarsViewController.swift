//
//  StarsViewController.swift
//  Stars
//
//  Created by Percy Ngan on 12/9/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//

import UIKit

class StarsViewController: UIViewController {

	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var distanceTextField: UITextField!
	@IBOutlet weak var tableView: UITableView!

	// PROPERTIES:
	let starController = StarController()

	override func viewDidLoad() {
		super.viewDidLoad()

	}

	// MARK: Actions
	@IBAction func printStars(_ sender: UIButton) {
	}

	@IBAction func createStar(_ sender: UIButton) {
		guard let name = nameTextField.text,
			let distanceString = distanceTextField.text,
			!name.isEmpty,
			!distanceString.isEmpty,
			let distance = Double(distanceString) else { return }

		// _ means that the value that is returned will not be used, the other option is to make the function @discardableResult in the model controller.
		starController.createStar(named: name, withDistance: distance)
		nameTextField.text = ""
		distanceTextField.text = ""
		nameTextField.becomeFirstResponder()
	}
	
}

