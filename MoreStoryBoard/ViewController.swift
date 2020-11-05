//
//  ViewController.swift
//  MoreStoryBoard
//
//  Created by SAM on 2020/10/30.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func changePage(_ sender: UISegmentedControl) {
        let x = CGFloat(sender.selectedSegmentIndex) * scrollView.bounds.width
        let offset = CGPoint(x: x, y: 0)
        scrollView.setContentOffset(offset, animated: true)
    }
    

}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        segmentedControl.selectedSegmentIndex = index
    }
}
