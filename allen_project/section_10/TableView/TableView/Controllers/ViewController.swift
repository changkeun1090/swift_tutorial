

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var moviesArray: [Movie] = []
    var movieDataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 대리자 설정 - 'tableView.delegate = self'와 같은 기능
        tableView.dataSource = self
        tableView.delegate = self
        
        // Cell 높이 설정
        tableView.rowHeight = 120
        title = "영화목록"
        
        movieDataManager.makeMovieData()
        moviesArray = movieDataManager.getMovieData()
    }
            
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        movieDataManager.updateMovieData()
        moviesArray = movieDataManager.getMovieData()
        tableView.reloadData() // tableView를 다시 렌더링
    }
}

// UITableViewDataSource: TableView와 ViewControl이 소통하기 위해 필요한 프로토콜
extension ViewController: UITableViewDataSource {
    
    // 몇개의 cell을 만들까? (UITableViewDataSource에 포함)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return moviesArray.count
    }
    
    // Cell을 어떻게 만들까? (UITableViewDataSource에 포함)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
           
        // dequeueReusableCell: 현재 Heap에 올라와있는 Cell 중 존재하면 재사용, 없으면 새로 생성.
        // 스토리보드로 만든 경우 자동으로 Heap에 Cell을 등록시킨다. (코드의 경우 tableView.register() 사용)
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        // 스토리보드에서 MovieCell의 Idetifier를 "MovieCell"로 지정해야 한다.
        
        let movie = moviesArray[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        cell.selectionStyle = .none
         
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    // Cell이 터치되었을 때 호출.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            let array = movieDataManager.getMovieData()
            let indexPath = sender as! IndexPath
            
            detailVC.movieData = array[indexPath.row]
        }
    }
}

