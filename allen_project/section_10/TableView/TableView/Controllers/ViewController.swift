// UITableViewDataSource: TableView와 ViewControl이 소통하기 위해 필요한 프로토콜

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var moviesArray: [Movie] = []
    var movieDataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 대리자 설정 - 'tableView.delegate = self'와 같은 기능
        tableView.dataSource = self
        tableView.rowHeight = 120
        
        movieDataManager.makeMovieData()
        moviesArray = movieDataManager.getMovieData()
    }
    
}

extension ViewController: UITableViewDataSource {
    // 몇개의 cell을 만들까? (UITableViewDataSource에 포함)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return moviesArray.count
    }
    
    // Cell을 어떻게 만들까? (UITableViewDataSource에 포함)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
       
        // 스토리보드로 만들었기 때문에 tableView에 cell을 등록하는 과정이 생략.
        // -> tableView.register()
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        // 스토리보드에서 MovieCell의 Idetifier를 "MovieCell"로 지정해야 한다.
         
        let movie = moviesArray[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
         
        
        return cell
    }
}
