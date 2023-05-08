//
//  ExerciseDetailsViewController.swift
//  EassyWorkOut
//
//  Created by jeashan nauja  on 2023-05-09.
//

import UIKit
import AVKit

class ExerciseDetailsViewController: UIViewController {

    var exercise: Exercise?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bodyPartLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var videoButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
    }

    private func updateUI() {
        guard let exercise = self.exercise else {
            return
        }
        self.nameLabel.text = exercise.name
        self.bodyPartLabel.text = exercise.bodyPart
        self.repsLabel.text = "\(exercise.reps) reps"
        self.setsLabel.text = "\(exercise.sets) sets"
        self.timeLabel.text = "\(exercise.time) seconds"
        if let videoURL = exercise.videoURL {
            self.videoButton.isHidden = false
        } else {
            self.videoButton.isHidden = true
        }
    }

    @IBAction func playVideoButtonTapped(_ sender: Any) {
        // Replace this with your own code to play the video
    }
}

struct Exercise {
    let name: String
    let bodyPart: String
    let reps: Int
    let sets: Int
    let time: Int
    let videoURL: URL?
}
