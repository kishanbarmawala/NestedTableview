//
//  InnerTableCell.swift
//  NestedTableview
//
//  Created by Kishan Barmawala on 02/08/23.
//

import UIKit

class InnerTableCell: UITableViewCell {
    
    @IBOutlet weak var verticalBottomLineView: UIView!
    @IBOutlet weak var detailView: UIView!{
        didSet {
            detailView.layer.cornerRadius = 8
            detailView.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblPercentage: UILabel!
    
    var studentsData: StudentsData? = nil {
        didSet {
            lblName.attributedText = setAttributeString(title: "Name: ", data: studentsData?.name)
            lblAge.attributedText = setAttributeString(title: "Age: ", data: studentsData?.age)
            lblGender.attributedText = setAttributeString(title: "Gender: ", data: studentsData?.gender)
            lblPercentage.attributedText = setAttributeString(title: "Percentage: ", data: studentsData?.percentage)
        }
    }
    
    func setAttributeString(title: String, data: String? = "") -> NSAttributedString {
        let fs: CGFloat = 14
        let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fs, weight: .semibold)]
        let dataAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fs, weight: .regular)]
        
        let partOne = NSMutableAttributedString(string: title, attributes: titleAttribute)
        let partTwo = NSMutableAttributedString(string: data!, attributes: dataAttribute)
        
        let combination = NSMutableAttributedString()
        combination.append(partOne)
        combination.append(partTwo)
        return combination
    }
}
