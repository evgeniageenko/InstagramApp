//
//  ViewController.swift
//  TMS - Lesson 12
//
//  Created by Евгений Агеенко on 24.05.21.
//

import UIKit


final class ListingViewController: UIViewController {
    

    private var dataSourse = [
        ListingModel(profilTitle: "Ngolo Kante",
                     profilImage: #imageLiteral(resourceName: "5 - Ngolo"),
                     listingImage: #imageLiteral(resourceName: "5 - Ngolo"),
                     description: "ngolololololololololololollololollololollololol",
                     statistics: (like: 534538, views: 257291),
                     isLiked: false,
                     isExpanded: false, identifier: 0, isBookmarked: false,
                     comments: [
                        CommentModel(commentOwner: "evgeniageenko", commentText: "wow"),
                        CommentModel(commentOwner: "nikitarutkevich", commentText: "super"),
                        CommentModel(commentOwner: "astyle", commentText: "amazing")
                     ]),
        
        ListingModel(profilTitle: "Eden Hazard",
                     profilImage: #imageLiteral(resourceName: "2 - EdenHazard"),
                     listingImage: #imageLiteral(resourceName: "2 - EdenHazard"),
                     description: "hazaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaard",
                     statistics: (like: 742527, views: 557291),
                     isLiked: false,
                     isExpanded: false, identifier: 1, isBookmarked: false,
                     comments: [
                        CommentModel(commentOwner: "evgeniageenko", commentText: "back to Chelsea"),
                        CommentModel(commentOwner: "nikitarutkevich", commentText: "KTBFFH"),
                        CommentModel(commentOwner: "astyle", commentText: "💙💙💙")
                     ]),
        ListingModel(profilTitle: "Edouard Mendy",
                     profilImage: #imageLiteral(resourceName: "3 - Mendy"),
                     listingImage: #imageLiteral(resourceName: "3 - Mendy"),
                     description: "eduuuuuu",
                     statistics: (like: 545353, views: 257291),
                     isLiked: false,
                     isExpanded: false, identifier: 2, isBookmarked: false,
                     comments: [
                        CommentModel(commentOwner: "evgeniageenko", commentText: "🤩🏆💙"),
                        CommentModel(commentOwner: "nikitarutkevich", commentText: "best goalkeeper"),
                        CommentModel(commentOwner: "astyle", commentText: "PERFECt!!!!")
                     ]),
        ListingModel(profilTitle: "Maison Mount",
                     profilImage: #imageLiteral(resourceName: "4 - Maunt"),
                     listingImage: #imageLiteral(resourceName: "4 - Mount"),
                     description: "maisooomaisooooooooooooooooooooooooooooooooooooooooonmaisooooooooooooooooooooooooooooooooooooooooonmaisoooooooooooooooooooooooooonmaisooooooooooooooooooooooooon",
                     statistics: (like: 645245, views: 257291),
                     isLiked: false,
                     isExpanded: false, identifier: 3, isBookmarked: false,
                     comments:[
                        CommentModel(commentOwner: "evgeniageenko", commentText: "awesom perfomance 🦁"),
                        CommentModel(commentOwner: "nikitarutkevich", commentText: "Champion!!"),
                        CommentModel(commentOwner: "astyle", commentText: "lionnnnnnnn")
                     ]),
        ListingModel(profilTitle: "Tony Rudiger",
                     profilImage: #imageLiteral(resourceName: "1 - Rudiger"),
                     listingImage: #imageLiteral(resourceName: "1 - Rudiger"),
                     description: "rudiii",
                     statistics: (like: 772414, views: 257291),
                     isLiked: false,
                     isExpanded: false, identifier: 4, isBookmarked: false,
                     comments: [
                        CommentModel(commentOwner: "evgeniageenko", commentText: "🇩🇪🇩🇪🇩🇪"),
                        CommentModel(commentOwner: "nikitarutkevich", commentText: "best defender"),
                        CommentModel(commentOwner: "astyle", commentText: "amazing")
                     ])
    ]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        
        
        // NIB - XIB это одно и тоже
        tableView.register(UINib(nibName: ListingCell.description(), bundle: nil), forCellReuseIdentifier: ListingCell.description())
        
    }
}


// MARK: - UITableViewDataSource, UITableViewDelegate
//метод UItableViewDataSource - устанавливвает кол-во ячеек
extension ListingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSourse.count
    }
    
    //Метод, где устанавливаем ячейку
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    // Добавляем свою кастомную ячейку
    let cell = tableView.dequeueReusableCell(withIdentifier: ListingCell.description(), for: indexPath) as! ListingCell
        
//        let modelArrays = dataSourse.compactMap({ListingCellModel(profileTitle: $0.title, profileImage: $0.profileImage, listingImage: $0.image, isLiked: $0.isLiked, likesCount: $0.variable.like, description: $0.attributeddescription)})
    let modelArray = dataSourse.compactMap({ListingCellModel(parameters: $0)})
        
    
    //Передаем значения в ячейку
        cell.delegate = self
        cell.setupWithModel(model: modelArray[indexPath.row])
    
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        listingImageTapped(id: dataSourse[indexPath.row].identifier)
//    
//    }
    
    
}

//MARK: - ListingCellDelegate
extension ListingViewController: ListingCellDelegate {
    
    func listingImageTapped(id: Int) {
        guard let data = dataSourse.first(where: {$0.identifier == id}) else {return}
        
        let contoller = ListingFullPhotoViewController(image: data.listingImage)
        let navi = UINavigationController(rootViewController: contoller)
        present(navi, animated: true, completion: nil)
    }
    
    func settingButtonAction(id: Int) {
        
    }
    
    func bookmarkButtonAction(id: Int) {
        dataSourse.first(where: {$0.identifier == id})?.isBookmarked.toggle()
        tableView.reloadData()
        
        NotificationCenter.default.post(name: .postBookmark, object: nil)
        
    }
    
    
    func shareButtonAction(id: Int) {
        
    }
    
    func commentButtonAction(id: Int) {
        let controller = CommentViewController(id: id)
        present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
        
    }
    
    
    
    func likeButtonAction(id: Int) {
        dataSourse.first(where: {$0.identifier == id})?.isLiked.toggle()
        
        if ((dataSourse.first(where: {$0.identifier == id})?.isLiked == true )) {
            dataSourse.first(where: {$0.identifier == id})?.statistics.like += 1
        } else {
            dataSourse.first(where: {$0.identifier == id})?.statistics.like -= 1
        }
        tableView.reloadData()
    }
    
    
    func expendButtonTapped(id: Int) {
        dataSourse.first(where: {$0.identifier == id})?.isExpanded = true
        tableView.reloadData()
    }
    
    func showAllCommentAction(id: Int) {
        dataSourse.first(where: {$0.identifier == id})?.commentsShowed.toggle()
        tableView.reloadData()
    }
}


//MARK: - CommentViewControllerDelegate
extension ListingViewController: CommentViewControllerDelegate {
    func comentSaved(identifier: Int, comment: String) {
        dataSourse.first(where: {$0.identifier == identifier})?.comments.append(CommentModel(commentOwner: "", commentText: comment))
        tableView.reloadData()

    }
}


