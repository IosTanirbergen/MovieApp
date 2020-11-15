//
//  ViewController.swift
//  MovieApp
//
//  Created by Devnull on 15.11.2020.
//

import UIKit

class MovieViewController: UIViewController {
    let movieCellID = "movieCellID"
    var arrMovieVM = [MovieViewModel]()
    var currentPage = 0
    var movies = [Results]()
    lazy var movieTableView: UITableView = {
        let tv = UITableView(frame: .zero,style: .grouped)
        return tv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blackClassic()
        setupMovieTableView()
        setupNavbar()
        self.movieTableView.refreshControl?.tintColor = .white
        self.getMovieData(refresh: true)
        movieTableView.refreshControl = UIRefreshControl()
        movieTableView.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
     func getMovieData(refresh: Bool = false){
        if refresh{
            movieTableView.refreshControl?.tintColor = .white
            movieTableView.refreshControl?.beginRefreshing()
        }
        Networking.shareInstance.getMovieData { (movies, error) in
            self.arrMovieVM = movies?.map({return MovieViewModel(movie: $0) }) ?? []
            if refresh {
                self.movieTableView.refreshControl?.endRefreshing()
              }
             
            DispatchQueue.main.async {
                self.movieTableView.reloadData()
            }
        }
    }
    
    fileprivate func setupMovieTableView(){
        movieTableView.dataSource = self
        movieTableView.delegate = self
        movieTableView.backgroundColor = UIColor.blackClassic()
        view.addSubview(movieTableView)
        //movieTableView.allowsMultipleSelection = true
        movieTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: movieCellID)
        movieTableView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    @objc func refreshData(){
        self.getMovieData(refresh: true)
        UIView.animate(withDuration: 1) {
            self.movieTableView.transform = .identity
        }
    }
    
    func getPageCount(TotalCount : Int) -> Int{
        var num = TotalCount
        let reminder = num % 50
        print(reminder)
        if reminder != 0{
            num = TotalCount/50
            num = num + 1

        }else{
            num = TotalCount/50
        }
        return num
    }
}


