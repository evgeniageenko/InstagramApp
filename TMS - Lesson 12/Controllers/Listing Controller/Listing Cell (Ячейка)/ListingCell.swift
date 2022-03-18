//
//  ListingTableViewCell.swift
//  TMS - Lesson 12
//
//  Created by Евгений Агеенко on 24.05.21.
//

import UIKit


protocol ListingCellDelegate: AnyObject {
    func settingButtonAction(id: Int)
    func bookmarkButtonAction(id: Int)
    func shareButtonAction(id: Int)
    func commentButtonAction(id: Int)
    func likeButtonAction(id: Int)
    func expendButtonTapped(id: Int)
    func showAllCommentAction(id: Int)
    
    func listingImageTapped(id: Int)
    
}

class ListingCellModel {
    let profileTitle: String?
    let profileImage: UIImage?
    let listingImage: UIImage?
    let isLiked: Bool
    let likeCount: Int
    let isExpand: Bool
    let photoDescrition: NSAttributedString?
    let comment: NSAttributedString?
    let numberComments: Int
    let commentsShowed: Bool
    let identifier: Int
    let isBookmark: Bool
    
    init(parameters: ListingModel) {
        self.profileTitle = parameters.profileTitle
        self.profileImage = parameters.profileImage
        self.listingImage = parameters.listingImage
        self.isLiked = parameters.isLiked
        self.likeCount = parameters.statistics.like
        self.isExpand = parameters.isExpanded
        self.photoDescrition = parameters.attributedDescription
        self.comment = parameters.attributedComments
        self.numberComments = parameters.numberComments
        self.commentsShowed = parameters.commentsShowed
        self.identifier = parameters.identifier
        self.isBookmark = parameters.isBookmarked
    }
}


final class ListingCell: UITableViewCell {
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var profileTitle: UILabel!
    @IBOutlet private weak var listingImage: UIImageView!
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var likeCountLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonElse: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var labelAllComments: UILabel!
    @IBOutlet weak var showAllCommentsButton: UIButton!
    @IBOutlet weak var constraintButtonAllCommentsHeight: NSLayoutConstraint!
    private var identifier: Int?
    
    //подписываемся под созданный делегат
    weak var delegate: ListingCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        listingImage.addGestureRecognizer(tap)
    }
    
    //тоже самое, что и viewDidload() - своя кастомная функция
    func setupWithModel(model: ListingCellModel) {
        self.identifier = model.identifier
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        commentButton.transform = CGAffineTransform (scaleX: -1, y: 1)
        
        if let name = model.profileTitle {
            profileTitle.text = name
        }
        
        if let profileImg = model.profileImage {
            profileImage.image = profileImg
        }
        if let listingImg = model.listingImage {
            listingImage.image = listingImg
        }
        
        
        likeButton.setImage(UIImage.init(systemName: model.isLiked ? "heart.fill" : "heart"), for: .normal)
        likeButton.tintColor = model.isLiked ? .red : .black
        
        shareButton.setImage(UIImage.init(systemName: model.isBookmark ? "bookmark.fill" : "bookmark"), for: .normal)
        
        
        
        likeCountLabel.text = "\(model.likeCount)"
        
        
        descriptionLabel.attributedText = model.photoDescrition
        descriptionLabel.numberOfLines = model.isExpand ? 0 : 1
        descriptionLabel.lineBreakMode = .byTruncatingTail
        
        //        descriptionRightConstraint.constant = model.isExpand ? 13 : 50
        
        //        labelAllComments.attributedText = model.comment
        
        
        
        //        if !model.isExpand {
        //            descriptionRightConstraint.constant = 5
        //            buttonElse.isHidden = !model.isExpand
        //        } else {
        //            let isMoreThenOneLine = descriptionLabel.calculateMaxLines() > 1
        //            descriptionRightConstraint.constant = isMoreThenOneLine ? 40 : 5
        //            buttonElse.isHidden = isMoreThenOneLine ? false : true
        //        }
        //
        if model.numberComments == 0 {
            showAllCommentsButton.isHidden = true
            constraintButtonAllCommentsHeight.constant = 0
        } else {
            showAllCommentsButton.isHidden = false
            showAllCommentsButton.setTitle("Посмотреть все комментарии: (\(model.numberComments))", for: .normal)
            constraintButtonAllCommentsHeight.constant = 20
            labelAllComments.attributedText = model.comment
        }
        
        labelAllComments.numberOfLines = model.commentsShowed ? 0 : 1
        labelAllComments.lineBreakMode = .byTruncatingTail
        
        
        
        
    }
    
    override class func description() -> String {
        return "ListingCell"
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        guard let id = identifier else { return }
        delegate?.listingImageTapped(id: id)
    }
    
    @IBAction private func bookmarkButton(_ sender: Any) {
        guard let id = identifier else { return }
        delegate?.bookmarkButtonAction(id: id)
    }
    
    @IBAction private func shareButton(_ sender: Any) {
        guard let id = identifier else { return }
        delegate?.shareButtonAction(id: id)
    }
    
    @IBAction private func commentButton(_ sender: Any) {
        guard let id = identifier else { return }
        delegate?.commentButtonAction(id: id)
    }
    
    @IBAction private func likeButtonAction(_ sender: Any) {
        guard let id = identifier else { return }
        delegate?.likeButtonAction(id: id)
    }
    
    @IBAction private func expendButtonTapped(_ sender: Any) {
        guard let id = identifier else { return }
        delegate?.expendButtonTapped(id: id)
    }
    
    @IBAction func showAllCommentAction(_ sender: Any) {
        guard let id = identifier else { return }
        delegate?.showAllCommentAction(id: id)
    }
    
    @IBAction func addCommentButtonAction(_ sender: Any) {
        guard let id = identifier else { return }
        delegate?.commentButtonAction(id: id)
        
    }
    
}
