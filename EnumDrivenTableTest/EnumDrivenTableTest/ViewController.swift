//
//  ViewController.swift
//  EnumDrivenTableTest
//
//  Created by Luis Rafael Muñoz Hueso on 31/03/16.
//  Copyright © 2016 Serendipio. All rights reserved.
//

import UIKit

protocol TableSection {
	static var rows: [Self] { get }
	
	var title: String { get }
	
	var mandatoryField: Bool { get }
}

extension TableSection {
	var mandatoryTitle: String {
		if mandatoryField {
			return "\(title)*"
		} else {
			return title
		}
	}
}

enum RegisterTableSection: Int, TableSection {
	case Username
	case Birthdate
	case Password
	case RepeatPassword
	
	static var rows: [RegisterTableSection] {
		return [.Username, .Password, .RepeatPassword]
	}
	
	var title: String {
		switch self {
		case .Username:
			return "Username"
		case .Birthdate:
			return "Date of birth"
		case .Password:
			return "Password"
		case .RepeatPassword:
			return "Repeat password"
		}
	}
	
	var mandatoryField: Bool {
		switch self {
		case .Username:
			return true
		case .Birthdate:
			return false
		case .Password:
			return true
		case .RepeatPassword:
			return true
		}
	}
}

class ViewController: UITableViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return RegisterTableSection.rows.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		guard let row = RegisterTableSection(rawValue: indexPath.row) else {
			// This should never happen
			return UITableViewCell()
		}
		
		let cell = UITableViewCell()
		cell.textLabel?.text = row.mandatoryTitle
		return cell
		
	}
}

