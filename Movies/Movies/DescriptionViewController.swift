//
//  DescriptionViewController.swift
//  Movies
//
//  Created by Aida Moldaly on 19.05.2022.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet var myCastCollectioView: UICollectionView!
    @IBOutlet var filmsImageView: UIImageView!
    @IBOutlet var filmsTitleView: UILabel!
    @IBOutlet var filmsDateView: UILabel!
    @IBOutlet var filmsDescriptionView: UILabel!
    @IBOutlet var castsTitleView: UILabel!

                  
    var filmsImage: UIImage?
    var filmsTitle: String?
    var filmsDate: String?
    var filmsDescription: String?
//    var actorsCast: Casts
    
    var casts: [Casts] = [
        Casts.init(image: .init(named: "1.jpeg"), name: "Park Shin-Hye", position: "As Cha Eun",id: 1, movie: "Heirs", biograpy: "Park Shin-hye is a South Korean actress and singer. She gained recognition as a child on TV shows such as Stairway to Heaven, and Tree of Heaven. Later on, she would achieve further success when she starred in the film Miracle in Cell No. 7, one of the highest grossing Korean films of all-time.", birthday: "February 18, 1990 (age 32 years), Nam-gu, Gwangju, South Korea"),
        Casts.init(image: .init(named: "2.jpeg"), name: "Lee Min-Ho", position: "As Kim Tan", id: 2, movie: "Heirs", biograpy: "Lee Min-ho is a South Korean actor, singer, model, creative director and businessman. He gained widespread fame worldwide with his role as Gu Jun-pyo in Boys Over Flowers which also earned him the Best New Actor award at the 45th Baeksang Arts Awards. ", birthday: "June 22, 1987 (age 34 years), Heukseok-dong, Seoul, South Korea"),
        Casts.init(image: .init(named: "3.jpeg"), name: "Wo-bin Kim", position: "As Young", id: 3, movie: "Heirs", biograpy: "Kim Woo-bin is a South Korean actor and model. He began his career as a runway model and made his acting debut in the television drama White Christmas. He subsequently gained attention in A Gentleman's Dignity, and made his breakthrough with School 2013 and The Heirs.", birthday: "July 16, 1989 (age 32 years), Seoul, South Korea"),
        Casts.init(image: .init(named: "4.jpeg"), name: "Kim Ji-Won", position: "As Rachel", id: 4, movie: "Heirs", biograpy: "Kim Ji-won is a South Korean actress. She gained attention through her roles in television series The Heirs, Descendants of the Sun, Fight for My Way, Arthdal Chronicles, Lovestruck in the City, and My Liberation Notes. The success of Kim's television dramas throughout Asia established her as a Hallyu star.", birthday: "October 19, 1992 (age 29 years), Geumcheon-gu, Seoul, South Korea"),
        Casts.init(image: .init(named: "5.jpeg"), name: "Krystal Jung", position: "As Lee Bo", id: 5, movie: "Heirs", biograpy: "Chrystal Soo Jung, professionally known as Krystal, Krystal Jung or Jung Soo-jung, is a Korean-American singer and actress based in South Korea. She debuted in 2009 as a member of the South Korean girl group f(x) and has further participated in SM Entertainment's project group SM the Ballad.", birthday: "October 24, 1994 (age 27 years), San Francisco, California, United States"),
    ]
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCastCollectioView.dataSource = self
        filmsImageView.image = filmsImage
        filmsTitleView.text = filmsTitle
        filmsDateView.text = filmsDate
        filmsDescriptionView.text = filmsDescription
         
    }
}

extension DescriptionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return casts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCastCell", for: indexPath) as! CastCell
        cell.setUp(with: casts[indexPath.row])

        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CastMemberViewController") as! CastMemberViewController
        vc.actorImage =  casts[indexPath.row].image
        vc.actorName = casts[indexPath.row].name
        vc.actorBirthday = casts[indexPath.row].birthday
        vc.actorActing = casts[indexPath.row].position
        vc.actorBiography = casts[indexPath.row].biograpy

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}




