//
//  ViewController3.swift
//  IONO
//
//  Created by Alexandra Medina on 9/9/21.
//

import UIKit
class ViewController3: UIViewController {
    
    // MARK: - Properties

    private let swipeableView: UIView = {
        // Initialize View
        let view = UIView(frame: CGRect(origin: .zero,
                                        size: CGSize(width: 200.0, height: 200.0)))

        // Configure View
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add to View Hierarchy
        view.addSubview(swipeableView)
        
        // Create Swipe Gesture Recognizers
        swipeableView.addGestureRecognizer(createSwipeGestureRecognizer(for: .up))
        swipeableView.addGestureRecognizer(createSwipeGestureRecognizer(for: .down))
        swipeableView.addGestureRecognizer(createSwipeGestureRecognizer(for: .left))
        swipeableView.addGestureRecognizer(createSwipeGestureRecognizer(for: .right))
        
        let swipeGestureRecognizerDown = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))

        
        // Configure Swipe Gesture Recognizer
        swipeGestureRecognizerDown.direction = .down
        
        // Add Swipe Gesture Recognizer
        swipeableView.addGestureRecognizer(swipeGestureRecognizerDown)
        
        
    }

    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
        
        // Current Frame
        var frame = swipeableView.frame

        switch sender.direction {
        case .up:
            frame.origin.y -= 100.0
            frame.origin.y = max(0.0, frame.origin.y)
        case .down:
            frame.origin.y += 100.0

            if frame.maxY > view.bounds.maxY {
                frame.origin.y = view.bounds.height - frame.height
            }
        case .left:
            frame.origin.x -= 100.0
            frame.origin.x = max(0.0, frame.origin.x)
        case .right:
            frame.origin.x += 100.0

            if frame.maxX > view.bounds.maxX {
                frame.origin.x = view.bounds.width - frame.width
            }
        default:
            break
        }

        UIView.animate(withDuration: 0.25) {
            self.swipeableView.frame = frame
        }

    }
    
    // MARK: - Helper Methods

    private func createSwipeGestureRecognizer(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        // Initialize Swipe Gesture Recognizer
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))

        // Configure Swipe Gesture Recognizer
        swipeGestureRecognizer.direction = direction

        return swipeGestureRecognizer
    }
}

    
