import Foundation
import UIKit

struct Member {
    
    lazy var memberImage: UIImage? = {
        guard let name = name else {
            return UIImage(systemName: "person")!
        }
        
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    
    // 모든 인스턴스가 공유하는 data
    static var memberNumbers: Int = 0
    
    let memberId: Int
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    init(name: String? = nil, age: Int? = nil, phone: String? = nil, address: String? = nil) {
        
        // 생성자에서 memberID 설정할 수 없도록 한다.
        self.memberId = Member.memberNumbers
        
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        Member.memberNumbers += 1
    }
    
}