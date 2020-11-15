//
//  MovieTableView + Datasource.swift
//  MovieApp
//
//  Created by Devnull on 15.11.2020.
//

import UIKit

extension MovieViewController: UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMovieVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
            let cell = tableView.dequeueReusableCell(withIdentifier: movieCellID,for: indexPath) as! MovieTableViewCell
            let modelVM = arrMovieVM[indexPath.row]
            cell.titleLabel.text = modelVM.title
            DispatchQueue.main.async {
                cell.imageMovie.setImage(imgURL: "https://image.tmdb.org/t/p/w500\(modelVM.backdrop_path!)")
            }
            cell.ratingLabel.text = modelVM.vote_average?.description
            cell.movieData.text = modelVM.release_date
            cell.saveButton.addTarget(self, action: #selector(handleSaveData), for: .touchUpInside)
            let backgroundView = UIView()
            backgroundView.backgroundColor = UIColor.black
            cell.selectedBackgroundView = backgroundView
            return cell
        
        //cell.detailTextLabel?.text = modelVM.original_title ?? ""!
       // cell.imageMovie.image = UIImage(named: modelVM.backdrop_path!)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height / 2.2
    }
    
    @objc fileprivate func handleSaveData(){
        print("1")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HomePageViewController {
            destination.data = movies[movieTableView.indexPathForSelectedRow!.row]
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = HomePageViewController()
        let model = arrMovieVM[indexPath.row]
        vc.titleLabel.text = model.title
        vc.movieData.text = model.release_date
        vc.movieImages.setImage(imgURL: "https://image.tmdb.org/t/p/w500\(model.backdrop_path!)")
        vc.descriptions.text = model.overview
        vc.ratingLabel.text = model.vote_average?.description
        navigationController?.pushViewController(vc, animated: true)
        //print(model.backdrop_path)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if indexPath.row % 2 == 0 {
                self.getMovieData(refresh: true)
            }
        }
    }
    
//    func loadNewData(){
//        for i in 1..<10{
//            let lastItem = arrMovieVM.count - 1
//            let newNum = lastItem + 1
//            arrMovieVM.append(<#T##newElement: MovieViewModel##MovieViewModel#>)
//        }
//    }
}
