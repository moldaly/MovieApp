//
//  MainViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 25.05.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var sectionNames: [String] = ["Today at the cinema", "Coming soon", "Trending"]
    
    private var soonAtTheCinema: [Movie] = [
        Movie.init(image: UIImage.init(named: "Heirss.jpeg"), name: "Heirs", rating: 9.9, genreIds: [1,3], id: 1, descriptionImage: UIImage.init(named: "HeirsDesc.jpeg"), date: "2016-12-23", description: "  Cha Eun Sang and her disabled mother both have to work hard, humiliating jobs, in order to support her older sister who's at university in America. Cha Eun Sang can't wait for her sister, who's her idol, to come back to Korea, and start earning money, so she can stop washing dishes and get a degree herself. However one day, Cha Eun Sang learns that her sister is about to get married, and realizes she'll never return to Korea, so she'll forever have to wash dishes. She resolves to go to America as well, and get better life."),
        Movie.init(image: UIImage.init(named: "The legend of the blue sea.jpeg") , name: "The legend of the blue sea", rating: 3.6, genreIds: [1], id: 2, descriptionImage: UIImage.init(named: "Legend-of-the-Blue-Featured.jpeg"), date: "2021-08-23", description: "  Inspired by a classic Joseon legend from Korea's first collection of unofficial historical tales, about a fisherman who captured and kidnapped a mermaid, this drama tells the love story between the son of a Joseon noble family named Kim Dam Ryung (Lee Min Ho) and a mermaid he named Se Hwa (Jun Ji Hyun). Sometime during August, 1598, newly appointed governor Kim Dam Ryung stays for a night at an inn run by Lord Yang (Sung Dong Il). During that evening, Lord Yang shows Dam Ryung a captured mermaid named Se Hwa. Later that night, Dam Ryung releases her into the ocean and, before she swims away, Se Hwa reaches out her hand to Dam Ryung which he briefly holds."),
        Movie.init(image: UIImage.init(named: "Boys_over_flowers.jpeg") , name: "Boys over flowers", rating: 6.8, genreIds: [2,4], id: 3, descriptionImage: UIImage.init(named: "BoysoverFlowerDes.png"), date: "2008-09-11", description: "  Poor girl Jan Di attends elite Shin Hwa High, where she's bullied by Joon Pyo, leader of F4 (the four richest and most gorgeous boys). Joon Pyo becomes attracted to Jan Di, but she has a crush on Yoon Ji Hoo, Joon Pyo's best friend. This is a Cinderella story about the F4 friends and the normal girl who manages to break into their clique and win their friendship along with the romantic affections of two of the four.")]
    
    private var todayAtTheCinema: [Movie] = [
        Movie.init(image: UIImage.init(named: "Heirss.jpeg"), name: "Heirs", rating: 9.9, genreIds: [1,3], id: 1, descriptionImage: UIImage.init(named: "HeirsDesc.jpeg"), date: "2016-12-23", description: "  Cha Eun Sang and her disabled mother both have to work hard, humiliating jobs, in order to support her older sister who's at university in America. Cha Eun Sang can't wait for her sister, who's her idol, to come back to Korea, and start earning money, so she can stop washing dishes and get a degree herself. However one day, Cha Eun Sang learns that her sister is about to get married, and realizes she'll never return to Korea, so she'll forever have to wash dishes. She resolves to go to America as well, and get better life."),
        Movie.init(image: UIImage.init(named: "The legend of the blue sea.jpeg") , name: "The legend of the blue sea", rating: 3.6, genreIds: [1], id: 2, descriptionImage: UIImage.init(named: "Legend-of-the-Blue-Featured.jpeg"), date: "2021-08-23", description: "  Inspired by a classic Joseon legend from Korea's first collection of unofficial historical tales, about a fisherman who captured and kidnapped a mermaid, this drama tells the love story between the son of a Joseon noble family named Kim Dam Ryung (Lee Min Ho) and a mermaid he named Se Hwa (Jun Ji Hyun). Sometime during August, 1598, newly appointed governor Kim Dam Ryung stays for a night at an inn run by Lord Yang (Sung Dong Il). During that evening, Lord Yang shows Dam Ryung a captured mermaid named Se Hwa. Later that night, Dam Ryung releases her into the ocean and, before she swims away, Se Hwa reaches out her hand to Dam Ryung which he briefly holds."),
        Movie.init(image: UIImage.init(named: "Boys_over_flowers.jpeg") , name: "Boys over flowers", rating: 6.8, genreIds: [2,4], id: 3, descriptionImage: UIImage.init(named: "BoysoverFlowerDes.png"), date: "2008-09-11", description: "  Poor girl Jan Di attends elite Shin Hwa High, where she's bullied by Joon Pyo, leader of F4 (the four richest and most gorgeous boys). Joon Pyo becomes attracted to Jan Di, but she has a crush on Yoon Ji Hoo, Joon Pyo's best friend. This is a Cinderella story about the F4 friends and the normal girl who manages to break into their clique and win their friendship along with the romantic affections of two of the four.")
    ]
    
    private var trending: [Movie] = [
        Movie.init(image: UIImage.init(named: "Heirss.jpeg"), name: "Heirs", rating: 9.9, genreIds: [1,3], id: 1, descriptionImage: UIImage.init(named: "HeirsDesc.jpeg"), date: "2016-12-23", description: "  Cha Eun Sang and her disabled mother both have to work hard, humiliating jobs, in order to support her older sister who's at university in America. Cha Eun Sang can't wait for her sister, who's her idol, to come back to Korea, and start earning money, so she can stop washing dishes and get a degree herself. However one day, Cha Eun Sang learns that her sister is about to get married, and realizes she'll never return to Korea, so she'll forever have to wash dishes. She resolves to go to America as well, and get better life."),
        Movie.init(image: UIImage.init(named: "The legend of the blue sea.jpeg") , name: "The legend of the blue sea", rating: 3.6, genreIds: [1], id: 2, descriptionImage: UIImage.init(named: "Legend-of-the-Blue-Featured.jpeg"), date: "2021-08-23", description: "  Inspired by a classic Joseon legend from Korea's first collection of unofficial historical tales, about a fisherman who captured and kidnapped a mermaid, this drama tells the love story between the son of a Joseon noble family named Kim Dam Ryung (Lee Min Ho) and a mermaid he named Se Hwa (Jun Ji Hyun). Sometime during August, 1598, newly appointed governor Kim Dam Ryung stays for a night at an inn run by Lord Yang (Sung Dong Il). During that evening, Lord Yang shows Dam Ryung a captured mermaid named Se Hwa. Later that night, Dam Ryung releases her into the ocean and, before she swims away, Se Hwa reaches out her hand to Dam Ryung which he briefly holds."),
        Movie.init(image: UIImage.init(named: "Boys_over_flowers.jpeg") , name: "Boys over flowers", rating: 6.8, genreIds: [2,4], id: 3, descriptionImage: UIImage.init(named: "BoysoverFlowerDes.png"), date: "2008-09-11", description: "  Poor girl Jan Di attends elite Shin Hwa High, where she's bullied by Joon Pyo, leader of F4 (the four richest and most gorgeous boys). Joon Pyo becomes attracted to Jan Di, but she has a crush on Yoon Ji Hoo, Joon Pyo's best friend. This is a Cinderella story about the F4 friends and the normal girl who manages to break into their clique and win their friendship along with the romantic affections of two of the four.")
    ]

    
    lazy var sectionMovies: [[Movie]] = [todayAtTheCinema, soonAtTheCinema, trending]
     
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: Bundle(for: MovieTableViewCell.self)), forCellReuseIdentifier: "MovieTableViewCell")
        tableView.estimatedRowHeight = 355
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        cell.configure(with: (title: sectionNames[indexPath.row], movies: sectionMovies[indexPath.row]))
        return cell
    }
}
