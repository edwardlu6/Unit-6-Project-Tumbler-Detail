//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by 卢广义 on 2023/10/22.
//
import Nuke
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lableView: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Configure the labels

        lableView.text = post.title
        textView.text = post.overview

        // Unwrap the optional vote average
        if let voteAverage = post.voteAverage {

            // voteAverage is a Double
            // We can convert it to a string using `\(post.voteAverage)` (aka *String Interpolation*)
            // inside string quotes (aka: *string literal*)
            voteLabel.text = "Vote Average: \(voteAverage)"
        } else {

            // if vote average is nil, set vote average label text to empty string
            voteLabel.text = ""
        }

        // The `releaseDate` is a `Date` type. We can convert it to a string using a `DateFormatter`.
        // Create a date formatter
        let dateFormatter = DateFormatter()

        // Set the date style for how the date formatter will display the date as a string.
        // You can experiment with other settings like, `.short`, `.long` and `.full`
        dateFormatter.dateStyle = .medium

        // Unwrap the optional release date
        if let releaseDate = post.releaseDate {

            // Use the the date formatter's `string(from: Date)` method to convert the date to a string
            let releaseDateString = dateFormatter.string(from: releaseDate)
            releaseDateLabel.text = "Release Date: \(releaseDateString)"
        } else {

            // if release date is nil, set release date label text to empty string
            releaseDateLabel.text = ""
        }

        // Do any additional setup after loading the view.
    }
    
    post.caption.trimHTMLTags()
    
    if let posterPath = post.posterPath,

    // Create a url by appending the poster path to the base url. https://developers.themoviedb.org/3/getting-started/images
    let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + posterPath) {

        // Use the Nuke library's load image function to (async) fetch and load the image from the image url.
        Nuke.loadImage(with: imageUrl, into: posterImageView)
    }

    // Unwrap the optional backdrop path
    if let backdropPath = post.backdropPath,

    // Create a url by appending the backdrop path to the base url. https://developers.themoviedb.org/3/getting-started/images
    let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + backdropPath) {

        // Use the Nuke library's load image function to (async) fetch and load the image from the image url.
        Nuke.loadImage(with: imageUrl, into: backdropImageView)
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
