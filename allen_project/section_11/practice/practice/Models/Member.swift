import UIKit

struct Member {
    static var memberNumbers: Int = 0
    let memberId: Int
    
    lazy var memberImage: UIImage? = { // 지연속성은 반드시 초기화 필요. 
        guard let name = self.name else {
            return UIImage(systemName: "person")
        }
        
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    init(memberImage: UIImage? = nil, name: String? = nil, age: Int? = nil, phone: String? = nil, address: String? = nil) {
                
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        self.memberId = Member.memberNumbers == 0 ? 0:Member.memberNumbers        
        Member.memberNumbers += 1
    }
}
