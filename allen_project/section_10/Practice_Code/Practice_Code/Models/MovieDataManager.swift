import UIKit

let initialData = [
    Movie(image: UIImage(named: "batman.png"), title: "배트맨", desc: "배트맨이 출현하는 영화"),
    Movie(image: UIImage(named: "captain.png"), title: "캡틴 아메리카", desc: "캡틴 아메리카의 기원. 캡틴 아메리카는 어떻게 탄생하게 되었을까?"),
    Movie(image: UIImage(named: "ironman.png"), title: "아이언맨", desc: "토니 스타크가 출현, 아이언맨이 탄생하게된 계기가 재미있는 영화"),
    Movie(image: UIImage(named: "thor.png"), title: "토르", desc: "아스가르드의 후계자 토르가 지구에 오게되는 스토리"),
    Movie(image: UIImage(named: "hulk.png"), title: "헐크", desc: "브루스 배너 박사의 실험을 통해 헐크가 탄생하게 되는 영화"),
    Movie(image: UIImage(named: "spiderman.png"), title: "스파이더맨", desc: "피터 파커 학생에서 스파이더맨이 되는 과정을 담은 스토리"),
    Movie(image: UIImage(named: "blackpanther.png"), title: "블랙펜서", desc: "와칸다의 왕위 계승자 티찰과 블랙펜서가 되다."),
    Movie(image: UIImage(named: "doctorstrange.png"), title: "닥터스트레인지", desc: "외과의사 닥터 스트레인지가, 히어로가 되는 과정을 담은 영화"),
    Movie(image: UIImage(named: "guardians.png"), title: "가디언즈 오브 갤럭시", desc: "빌런 타노스에 맞서서 세상을 지키려는 가오겔 멤버들")
]

class MovieDataManager {
    
    var movieArray:[Movie] = []
    
    func setMovieArray() {
        movieArray = initialData
    }
    
    func getMovieArray() -> [Movie] {
        return movieArray
    }
    
}
