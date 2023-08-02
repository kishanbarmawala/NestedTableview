//
//  OuterTableCell.swift
//  NestedTableview
//
//  Created by Kishan Barmawala on 02/08/23.
//

import UIKit

class OuterTableCell: UITableViewCell {
    
    @IBOutlet weak var verticalLineView: UIView!
    @IBOutlet weak var lblSchoolName: UILabel!
    @IBOutlet weak var stackView: UIStackView! {
        didSet {
            stackView.layer.cornerRadius = 8
            stackView.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var innerTableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var paddingView: UIView!
    
    var index = Int()
    var helperDelegate: HelperDelegate?
    var schoolsData: SchoolsData? = nil {
        didSet {
            if let _schoolsData = schoolsData {
                innerTableView.isHidden = !_schoolsData.isExpanded
                lblSchoolName.text = _schoolsData.schoolName
                verticalLineView.isHidden = _schoolsData.isExpanded ? false : true
                innerTableView.dataSource = self
                innerTableView.reloadData()
            }
        }
    }
    
    override func awakeFromNib() {
        addTapEvent()
    }
    
    func addTapEvent() {
        let panGesture = UITapGestureRecognizer(target: self, action: #selector(handleActon))
        headerView.addGestureRecognizer(panGesture)
    }
    
    @objc private func handleActon() {
        if let isExpanded = schoolsData?.isExpanded {
            innerTableView.isHidden = !isExpanded
            paddingView.isHidden = isExpanded
            verticalLineView.isHidden = isExpanded
            schoolsData?.isExpanded = !isExpanded
            UIView.animate(withDuration: 0.3) {
                self.stackView.setNeedsLayout()
                self.helperDelegate?.heightChanged(index: self.index, value: !isExpanded)
            }
        }
    }
    
}

extension OuterTableCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolsData?.studentsData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InnerTableCell", for: indexPath) as? InnerTableCell else {
            return UITableViewCell()
        }
        cell.studentsData = schoolsData?.studentsData[indexPath.row]
        if let count = schoolsData?.studentsData.count {
            cell.verticalBottomLineView.isHidden = count - 1 == indexPath.row ? true : false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.invalidateIntrinsicContentSize()
        tableView.layoutIfNeeded()
    }
    
}
