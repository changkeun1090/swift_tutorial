import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movieArray:[Movie] = []
    var movieDataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieDataManager.makeMovieData()
        movieArray = movieDataManager.getMovieData()
        
        tableView.rowHeight = 120
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        movieDataManager.updateMovieData()
        movieArray = movieDataManager.getMovieData()
        tableView.reloadData()
        
        // 스크롤 가장 밑으로 내리기
        let lastRow = tableView.numberOfRows(inSection: 0) - 1
        if lastRow >= 0 {
            let indexPath = IndexPath(row: lastRow, section: 0)
            tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieCell
        
        let movie = movieArray[indexPath.row]
        
        cell.movieImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.movieDescriptionLabel.text = movie.movieDescription
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toDetail") {
            
            let indexPath = sender as! IndexPath
            let movieArray = movieDataManager.getMovieData()
            
            let detailVC = segue.destination as! DetailViewController                        
            detailVC.movieData = movieArray[indexPath.row]
            
        }
    }
    
}

