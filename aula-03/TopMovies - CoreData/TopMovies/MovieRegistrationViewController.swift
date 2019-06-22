//
//  MovieRegistrationViewController.swift
//  TopMovies
//
//  Created by Gabriel Pereira on 22/06/19.
//  Copyright © 2019 Gabriel Pereira. All rights reserved.
//

import UIKit

final class MovieRegistrationViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var textFieldRating: UITextField!
    @IBOutlet weak var textFieldDuration: UITextField!
    @IBOutlet weak var textFieldCategories: UITextField!
    @IBOutlet weak var textViewSummary: UITextView!
    @IBOutlet weak var buttonSave: UIButton!
    
    // MARK: - Properties
    var movie: Movie?
    var smallImage: UIImage?
    
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie {
            fillMovie(with: movie)
        }
    }
    
    // MARK: - Methods
    func fillMovie(with movie: Movie) {
        textFieldTitle.text = movie.title
        textFieldRating.text = movie.movieRating
        textFieldDuration.text = movie.duration
        textFieldCategories.text = movie.categories
        textViewSummary.text = movie.summary
        imageViewPoster.image = movie.image as? UIImage
        
        buttonSave.setTitle("Adicionar", for: .normal)
    }
    
    func selectPicture(sourceType: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        
        imagePicker.sourceType = sourceType
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIButton) {
        if movie == nil {
            movie = Movie(context: context)
        }
        
        movie?.title = textFieldTitle.text
        movie?.categories = textFieldCategories.text
        movie?.duration = textFieldDuration.text
        movie?.rating = Double(textFieldRating.text!) ?? 0.0
        
        if let smallImage = smallImage {
            movie?.image = smallImage
        }
        
        movie?.summary = textViewSummary.text
        
        do {
            try context.save()
        } catch {
            print("An error occurred while saving data", error)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectPoster(_ sender: UIButton) {
        let alert = UIAlertController(title: "Selecionar poster", message: "De onde você quer escolher o pôster do filme?", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Câmera", style: .default) { [weak self] (_) in
                guard let self = self else { return }
                
                self.selectPicture(sourceType: .camera)
            }
            
            alert.addAction(cameraAction)
        }
        
        let libraryAction = UIAlertAction(title: "Biblioteca de fotos", style: .default) { [weak self] (_) in
            guard let self = self else { return }
            
            self.selectPicture(sourceType: .photoLibrary)
        }
        
        let photosAction = UIAlertAction(title: "Álbum de fotos", style: .default) { [weak self] (_) in
            guard let self = self else { return }
            
            self.selectPicture(sourceType: .savedPhotosAlbum)
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alert.addAction(libraryAction)
        alert.addAction(photosAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - UIImagePickerControllerDelegate
extension MovieRegistrationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            let proportion: CGFloat = image.size.width / image.size.height
            let imageWidth: CGFloat = 800.00
            let size = CGSize(width: imageWidth, height: imageWidth / proportion)
            
            UIGraphicsBeginImageContext(size)
            
            image.draw(in: CGRect(origin: .zero, size: size))
            smallImage = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            imageViewPoster.image = smallImage
            
            smallImage?.jpegData(compressionQuality: 0.6)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
