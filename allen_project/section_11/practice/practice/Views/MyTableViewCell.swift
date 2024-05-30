//
//  TableViewCell.swift
//  Practice
//
//  Created by ChangKeun Ji on 5/29/24.
//

/*
init() {
    self.name = member?.name
    self.address = member?.address
    self.memberImage = member?.memberImage
}
*/

import UIKit

class MyTableViewCell: UITableViewCell {
    
    var member: Member? {
        didSet {
            self.name.text = member?.name
            self.address.text = member?.address
            self.memberImage = member?.memberImage ?? UIImage(systemName: "people")!
        }
    }
    
    private let name = UILabel()
    private let address = UILabel()
    private var memberImage = UIImage()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        setupView()
    }
    
    func setupView() {
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
