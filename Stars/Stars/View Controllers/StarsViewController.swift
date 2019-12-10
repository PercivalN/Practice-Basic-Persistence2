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
		
		tableView.dataSource = self // This creates a connection between the tableView data source and this view controller. This is only true is you have an extension that subclasses from a UITableViewDataSource.
	}
	
	// MARK: Actions
	@IBAction func printStars(_ sender: UIButton) {
		print(starController.listStars())
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
		tableView.reloadData()
	}
}

extension StarsViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return starController.stars.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "StarCell", for: indexPath) as? StarTableViewCell else { return UITableViewCell() }
		
		let star = starController.stars[indexPath.row]
		cell.star = star
		
		return cell
	}
}
