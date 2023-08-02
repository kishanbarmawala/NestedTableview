//
//  ViewController.swift
//  NestedTableview
//
//  Created by Kishan Barmawala on 02/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outerTableView: UITableView!
    
    var schoolsData = [
        SchoolsData(
            schoolName: "Delhi Public School",
            isExpanded: false,
            studentsData: [
                StudentsData(
                    name: "Prasanna Lochana",
                    age: "16",
                    gender: "Male",
                    percentage: "87%"
                ),
                StudentsData(
                    name: "Chand Chetana",
                    age: "14",
                    gender: "Female",
                    percentage: "63%"
                ),
                StudentsData(
                    name: "Shekhar Parminder",
                    age: "17",
                    gender: "Male",
                    percentage: "95%"
                )
            ]
        ),
        SchoolsData(
            schoolName: "Kendriya Vidyalaya",
            isExpanded: false,
            studentsData: [
                StudentsData(
                    name: "Shashi Jaya",
                    age: "19",
                    gender: "Female",
                    percentage: "71%"
                )
            ]
        ),
        SchoolsData(
            schoolName: "St. Xavier’s",
            isExpanded: false,
            studentsData: [
                StudentsData(
                    name: "Grishma Dinesh",
                    age: "16",
                    gender: "Female",
                    percentage: "79%"
                ),
                StudentsData(
                    name: "Nikita Om",
                    age: "18",
                    gender: "Female",
                    percentage: "56%"
                ),
                StudentsData(
                    name: "Nirmal Sharma",
                    age: "17",
                    gender: "Male",
                    percentage: "85%"
                )
            ]
        ),
        SchoolsData(
            schoolName: "Dhirubhai Ambani International School",
            isExpanded: false,
            studentsData: [
                StudentsData(
                    name: "Mina Jagannath",
                    age: "15",
                    gender: "Female",
                    percentage: "67%"
                ),
                StudentsData(
                    name: "Harsh Goyal",
                    age: "19",
                    gender: "Male",
                    percentage: "81%"
                )
            ]
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OuterTableCell", for: indexPath) as? OuterTableCell else {
            return UITableViewCell()
        }
        cell.index = indexPath.row
        cell.schoolsData = schoolsData[indexPath.row]
        cell.helperDelegate = self
        return cell
    }
    
}

extension ViewController: HelperDelegate {
    
    func heightChanged(index: Int, value: Bool) {
        schoolsData[index].isExpanded = value
        outerTableView.performBatchUpdates(nil)
    }
    
}
