//
//  FullPhotoViewController.swift
//  TMS - Lesson 12
//
//  Created by Евгений Агеенко on 17.06.21.
//

import UIKit

class FullPhotoViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var photoImage: UIImageView!
    
    let profileImage: UIImage
    let image: UIImage
    
    
    init(profileImage: UIImage, image: UIImage){
        self.profileImage = profileImage
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        
        avatarImage.image = profileImage
        photoImage.image = image
        
        
        scrollView.zoomScale = 1
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 5.0
        scrollView.contentSize = photoImage.frame.size
        scrollView.delegate = self

    }
    
    
    
    
    
 
    @IBAction func scaleButton(_ sender: Any) {
        
        func zoomRectForScale(scale : CGFloat, center : CGPoint) -> CGRect {
      
                var zoomRect = CGRect.zero
                if let imageV = photoImage {
                    zoomRect.size.height = imageV.frame.size.height / scale
                    zoomRect.size.width  = imageV.frame.size.width  / scale
                    let newCenter = imageV.convert(center, from: view)
                    zoomRect.origin.x = newCenter.x - ((zoomRect.size.width / 2.0))
                    zoomRect.origin.y = newCenter.y - ((zoomRect.size.height / 2.0))
                }
                return zoomRect
            }
        
        let zoomRect = zoomRectForScale(scale: 3.5, center: view.center )
                    scrollView.zoom(to: zoomRect, animated: true)
        
        
    }
}

//MARK: - UIScrollViewDelegate
extension FullPhotoViewController: UIScrollViewDelegate {
    
    //Возвращает зум в исходное положение
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        scrollView.zoomScale = 1
    }
    
    //Указываем, с какой картинкой работать
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoImage
    }
    
}
