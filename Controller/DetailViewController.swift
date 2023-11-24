//
//  DetailViewController.swift
//  MovieDatabase
//
//  Created by kraujalis.rolandas on 23/11/2023.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.systemBackground
        let scrollView = UIScrollView()
        let stackView = UIStackView()
//        stackView.backgroundColor = UIColor.red
//        scrollView.backgroundColor = UIColor.yellow
        
        let title = UILabel()
        let adult = UILabel()
        let orgTitle = UILabel()
        let overview = UILabel()
        let populiarity = UILabel()
        let releaseDate = UILabel()
        let vote = UILabel()
        let poster = UIImageView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        poster.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        scrollView.widthAnchor.constraint(equalToConstant: view.frame.size.width)
        ])
        
        poster.contentMode = .scaleAspectFit
        
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        
        scrollView.addSubview(stackView)
        scrollView.addSubview(poster)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        
        for i in [title, orgTitle, adult, populiarity, releaseDate, overview, vote] {
            i.translatesAutoresizingMaskIntoConstraints = false
            i.textColor = UIColor.label
            i.numberOfLines = 0
            stackView.addArrangedSubview(i)
        }
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            stackView.widthAnchor.constraint(equalToConstant: view.frame.size.width - 60),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 500),
            
            poster.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            poster.heightAnchor.constraint(equalToConstant: 550),
            poster.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            poster.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            poster.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        title.text = movie?.title ?? ""
        orgTitle.text = movie?.originalTitle == movie?.title ? "": movie?.originalTitle ?? ""
        if let forAdult = movie?.adult {
            adult.text = forAdult ? "adult" : "family"
        } else {
            adult.text = ""
        }
        if let date = movie?.releaseDate {
            releaseDate.text = "Released: " + date
        } else {
            releaseDate.text = ""
        }
        if let pop = movie?.popularity {
            populiarity.text = "Popularity: " + String(pop)
        } else {
            populiarity.text = ""
        }
        if let overv = movie?.overview {
            overview.text = "Overview:\n\t" + overv
        } else {
            overview.text = ""
        }
        if let voteCount = movie?.voteCount, let voteAverage = movie?.voteAverage {
            vote.text = "Vote average: \(voteAverage) of \(voteCount) votes"
        } else {
            vote.text = ""
        }
        //.cell.posterImageView.sd_setImage(with: URL(string: Constants.API.posterUrl.appending(movie.posterPath ?? "")))
        poster.sd_setImage(with: URL(string: Constants.API.posterUrl.appending(movie?.posterPath ?? "")))
        
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.textAlignment = .center
        orgTitle.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        orgTitle.textAlignment = .center
        adult.font = UIFont(name: "Mishafi", size: 15)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
