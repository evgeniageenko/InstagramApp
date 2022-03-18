//
//  ProfileCellViewController.swift
//  TMS - Lesson 12
//
//  Created by Евгений Агеенко on 10.06.21.
//

import UIKit

protocol FirstProtocol {
    var profileImage: UIImage {get set}
}
protocol SecondProtocol {
    var nameString: String {get set}
}
protocol ThirdProtocol {
    var interestsString: String {get set}
}
protocol FourthProtocol {
    var adressLabel: String {get set}
}
protocol FifthProtocol {
    var followersCount: String {get set}
}
protocol SixthProtocol {
    var followingCount: String {get set}
}
protocol SeventhProtocol {
    var postsCount: String {get set}
}
protocol EighthProtocol {
    var photos: [UIImage] {get set}
}

// Главная структура
struct ProfileControllerModel: FirstProtocol, SecondProtocol, ThirdProtocol, FourthProtocol, FifthProtocol, SixthProtocol, SeventhProtocol, EighthProtocol {
    
    var profileImage: UIImage
    var nameString: String
    var interestsString: String
    var adressLabel: String
    var followersCount: String
    var followingCount: String
    var postsCount: String
    var photos: [UIImage]
}


final class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableViewProfile: UITableView!
    
    enum ControllerSections {
        case mainInfo
        case photos
    }
    
    //откуда взяться данным - создаем переменную
    private var profileModel: ProfileControllerModel
    private let dataSource: [ControllerSections] = [.mainInfo, .photos]
    
    
    required init?(coder: NSCoder) {
        profileModel = ProfileControllerModel(profileImage: #imageLiteral(resourceName: "IMG_0184"), nameString: "Еvgeni Ageenko", interestsString: "Football ⚽️", adressLabel: "Belarus, Minsk", followersCount: "561", followingCount: "782", postsCount: "31", photos: [UIImage(named: "chelsea1")!, UIImage(named: "chelsea2")!, UIImage(named: "chelsea3")!,  UIImage(named: "chelsea4")!, UIImage(named: "chelsea5")!, UIImage(named: "chelsea6")!, UIImage(named: "chelsea7")!, UIImage(named: "chelsea8")!, UIImage(named: "chelsea9")!])
        
        super.init(coder: coder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewProfile.delegate = self
        tableViewProfile.dataSource = self
        //        tableViewProfile.rowHeight = 280
        
        
        // регистрация кастомной ячейки
        tableViewProfile.register(UINib(nibName: ProfileMainInfoCell.description(), bundle: nil), forCellReuseIdentifier: ProfileMainInfoCell.description())
        
        tableViewProfile.register(UINib(nibName: ProfilePhotosCell.description(), bundle: nil), forCellReuseIdentifier: ProfilePhotosCell.description())
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(addPhotoMethod),
                                               name: .postBookmark, object: nil)
        
        
    }
    
    @objc private func addPhotoMethod() {
        profileModel.photos.append(#imageLiteral(resourceName: "inst"))
        tableViewProfile.reloadData()
        
    }
    
    private func setupPhotosHeightFor(width: CGFloat) -> CGFloat {
        let sqareHeight = width / 3
        let rowsCount = Int(profileModel.photos.count / 3)
        let additionRow = profileModel.photos.count%3 > 0 ? 1 : 0
        let rowsSumm = rowsCount + additionRow
        
        return sqareHeight * CGFloat(rowsSumm)
    }

}



// MARK: - UITableViewDataSource, UITableViewDelegate
// метод numberOfRowsInSection - говорит таблице сколько будет ячеек
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    // метод heightForRowAt - говорит какая будет высота ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if dataSource[indexPath.row] == .photos {
            
            return setupPhotosHeightFor(width: tableView.frame.width)
            
        } else {
            return UITableView.automaticDimension
        }
    }
    
    // метод  cellForRowAt говорит таблице, что будет в качестве ячейки использоваться для конкретного индекса
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //indexPath у таблицы - это номер ячейки
        switch dataSource[indexPath.row] {
        case .mainInfo:

            let cell = tableViewProfile.dequeueReusableCell(withIdentifier: ProfileMainInfoCell.description(), for: indexPath) as! ProfileMainInfoCell
            let model = ProfileMainInfoCellModel(profileIamge: profileModel.profileImage, nameString: profileModel.nameString, interestsString: profileModel.interestsString, adressLabel: profileModel.adressLabel, followersCount: profileModel.followersCount, followingCount: profileModel.followingCount, postsCount: profileModel.postsCount)
            cell.setupWithModel(model: model)
            cell.delegate = self

            return cell

        case .photos:
            let cell = tableViewProfile.dequeueReusableCell(withIdentifier: ProfilePhotosCell.description(), for: indexPath) as! ProfilePhotosCell
            cell.delegate = self
            cell.setupWith(photos: profileModel.photos)
            
            return cell
            
        }
    }
}

//MARK: - ProfilePhotoCellDelegate
extension ProfileViewController: ProfilePhotosCellDelegate {
    func savePhoto(photo: UIImage) {
        let controller = FullPhotoViewController(profileImage: #imageLiteral(resourceName: "IMG_0184"), image: photo)
        present(controller, animated: true, completion: nil)
    }
}


//MARK: - ProfileCellDelegate
extension ProfileViewController: ProfileCellDelegate {
    func editProfile() {
        let alert = UIAlertController(title: "Внимание", message: "Вы переходите в рекдактор", preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        
        let action = UIAlertAction(title: "OK", style: .default) { action in
//            FullPhotoViewController(profileImage: "", image: imageLiteral)
        }
       
        let cancel = UIAlertAction(title: "Отмена", style: .cancel) { action in
        }
        
        
        alert.addAction(cancel)
        alert.addAction(action)
        
       
    
    }
}

