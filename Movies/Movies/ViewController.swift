//
//  ViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 18.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myTableView: UITableView!
    @IBOutlet var myGenreCollectionView: UICollectionView!
    
    var movies: [Movies] = [
        Movies.init(image: UIImage.init(named: "Heirss.jpeg") , name: "Heirs", rate: 9.9, id: 1, descriptionImage: UIImage.init(named: "HeirsDesc.jpeg"), date: "2016-12-23", description: "  Cha Eun Sang and her disabled mother both have to work hard, humiliating jobs, in order to support her older sister who's at university in America. Cha Eun Sang can't wait for her sister, who's her idol, to come back to Korea, and start earning money, so she can stop washing dishes and get a degree herself. However one day, Cha Eun Sang learns that her sister is about to get married, and realizes she'll never return to Korea, so she'll forever have to wash dishes. She resolves to go to America as well, and get better life."),
        Movies.init(image: UIImage.init(named: "The legend of the blue sea.jpeg") , name: "The legend of the blue sea", rate: 9.6, id: 2, descriptionImage: UIImage.init(named: "Legend-of-the-Blue-Featured.jpeg"), date: "2021-08-23", description: "  Inspired by a classic Joseon legend from Korea's first collection of unofficial historical tales, about a fisherman who captured and kidnapped a mermaid, this drama tells the love story between the son of a Joseon noble family named Kim Dam Ryung (Lee Min Ho) and a mermaid he named Se Hwa (Jun Ji Hyun). Sometime during August, 1598, newly appointed governor Kim Dam Ryung stays for a night at an inn run by Lord Yang (Sung Dong Il). During that evening, Lord Yang shows Dam Ryung a captured mermaid named Se Hwa. Later that night, Dam Ryung releases her into the ocean and, before she swims away, Se Hwa reaches out her hand to Dam Ryung which he briefly holds."),
        Movies.init(image: UIImage.init(named: "Boys_over_flowers.jpeg") , name: "Boys over flowers", rate: 6.8, id: 3, descriptionImage: UIImage.init(named: "BoysoverFlowerDes.png"), date: "2008-09-11", description: "  Poor girl Jan Di attends elite Shin Hwa High, where she's bullied by Joon Pyo, leader of F4 (the four richest and most gorgeous boys). Joon Pyo becomes attracted to Jan Di, but she has a crush on Yoon Ji Hoo, Joon Pyo's best friend. This is a Cinderella story about the F4 friends and the normal girl who manages to break into their clique and win their friendship along with the romantic affections of two of the four."),
        Movies.init(image: UIImage.init(named: "Are_You_Human_Too?.jpeg") , name: "Are You Human Too?", rate: 4.9, id: 4, descriptionImage: UIImage.init(named: "desHuman.jpeg"), date: "2020-05-07", description: "  Nam Shin is a son from a family who runs a large company. After an unexpected accident, he falls into a coma. His mother Oh Ro Ra is an authority on brain science and artificial intelligence. She creates an android named Nam Shin III which looks like just like her son Nam Shin. The android pretends to be Nam Shin and he has a bodyguard called Kang So Bong."),
        Movies.init(image: UIImage.init(named: "moon.jpeg") , name: "Moon Lovers: Scarlet Heart Ryeo", rate: 3.7, id: 5, descriptionImage: UIImage.init(named: "moondesc.jpeg"), date: "2019-07-15", description: "  When a total eclipse of the sun takes place, Go Ha Jin is transported back in time to the start of the Goryeo Dynasty of Korea during King Taejo's rule. She wakes up in the body of the 16-year-old Hae Soo and finds herself living in the house of the 8th Prince Wang Wook, who is married to Hae Soo's cousin. She soon befriends several of the princes and meets the ostracized 4th Prince, Wang So. Although knowing she should not get involved in palace intrigues over the succession to the throne, she inadvertently becomes a pawn in the struggle, as several of the Princes fall in love."),
        Movies.init(image: UIImage.init(named: "secretary kim.jpeg") , name: "What's Wrong with Secretary Kim", rate: 7.9, id: 6, descriptionImage: UIImage.init(named: "desKim.jpeg"), date: "2019-08-01", description: "  The series revolves around the narcissistic Lee Young Joon, the Vice Chairman of a company run by his family. He is very self-absorbed and thinks highly of himself, so much that he barely acknowledges the people around him. Lee Young Joon has a capable and patient secretary in Kim Mi So who has remained by his side and worked diligently for 9 years without any romantic involvement. However, Mi So now want to set her life and focus on herself so when she decides to resign from her job, hilarious misunderstandings ensue. ")
    ]
     
    var genres: [Genres] = [
        Genres.init(name: "All", id: 1),
        Genres.init(name: "Action", id: 2),
        Genres.init(name: "Drama", id: 3),
        Genres.init(name: "Horror", id: 4),
        Genres.init(name: "Detective", id: 5),
        Genres.init(name: "Comedy", id: 6),
        Genres.init(name: "Romance", id: 7),
        Genres.init(name: "Fantasy", id: 8)
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        myGenreCollectionView.dataSource = self
        title = "Movies"
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MovieCell
        cell.movieImage.image = movies[indexPath.row].image
        cell.movieName.text = movies[indexPath.row].name
        if movies[indexPath.row].rate! >= 9 {
            cell.movieRate.text = String("★ \(movies[indexPath.row].rate!)")
            cell.movieRate.backgroundColor = UIColor.green
        } else if movies[indexPath.row].rate! <= 9 && movies[indexPath.row].rate! >= 5 {
            cell.movieRate.text = String("★ \(movies[indexPath.row].rate!)")
            cell.movieRate.backgroundColor = UIColor.orange
        } else if movies[indexPath.row].rate! <= 5 {
            cell.movieRate.text = String("★ \(movies[indexPath.row].rate!)")
            cell.movieRate.backgroundColor = UIColor.red
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DescriptionViewController") as! DescriptionViewController
        vc.filmsTitle =  movies[indexPath.row].name
        vc.filmsImage = movies[indexPath.row].descriptionImage
        vc.filmsDate = movies[indexPath.row].date
        vc.filmsDescription = movies[indexPath.row].description
//        if movies[indexPath.row].name == casts[indexPath.row].
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myGenreCell", for: indexPath) as! GenreCell
        cell.setUp(with: genres[indexPath.row])
        cell.layer.borderColor = UIColor.orange.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        return cell
        
    }
    
}

