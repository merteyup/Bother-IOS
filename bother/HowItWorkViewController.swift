//
//  HowItWorkViewController.swift
//  bother
//
//  Created by Eyüp Mert on 11.08.2022.
//

import UIKit
import Lottie
import L10n_swift

class HowItWorkViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - Variables
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    //data for the slides
    var titles = ["main.We*were*all*bothered.".l10n(),
                  "main.And*we*did*nothing.".l10n(),
                  "main.Here's*a*place*to*share.".l10n(),
                  "main.Read*write*connect".l10n()]
    
    var descs = ["main.Mostly*with*tiny*things.".l10n(),
                 "main.Not*even*thought".l10n(),
                 "main.At*least*see*how*many".l10n(),
                 "main.Everyone*has*problems.".l10n()]
    
    var anims = ["argue","thinking","application","connect"]

    var lastPage = 0
    private var animationView: AnimationView?

    
    
    // MARK: - Outlets
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var btnEnable: UIButton!
    
    
    // MARK: - Statements

    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        lastPage = anims.count
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        //to call viewDidLayoutSubviews() and get dynamic width and height of scrollview

        self.scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false

        createSlides()
        
    }
    
    override func viewDidLayoutSubviews() {
        scrollWidth = scrollView.frame.size.width
        scrollHeight = scrollView.frame.size.height
    }
    
    
    @IBAction func pageChanged(_ sender: Any) {
        scrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((pageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
    }
    
    
    @IBAction func actionBack(_ sender: Any) {
        dismiss(animated: true)
    }
        
    
    @IBAction func actionNext(_ sender: UIButton) {
        nextPage(pageNumber: 1)
    }
    
    @IBAction func actionEnable(_ sender: UIButton) {
        
      
    }
        
        // MARK: - Functions
        fileprivate func createSlides() {
            //crete the slides and add them
            var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            for index in 0..<titles.count {
                frame.origin.x = scrollWidth * CGFloat(index)
                frame.size = CGSize(width: scrollWidth, height: scrollHeight)
                let slide = UIView(frame: frame)
                //subviews
                
            
                
                  animationView = .init(name: anims[index])
                  animationView!.frame = CGRect(x:0,y:0,width:300,height:300)
                  // 3. Set animation content mode
                  animationView!.contentMode = .scaleAspectFit
                  // 4. Set animation loop mode
                  animationView!.loopMode = .loop
                  // 5. Adjust animation speed
                  animationView!.animationSpeed = 0.5
                  animationView!.center = CGPoint(x:scrollWidth/2,y: scrollHeight/2 - 50)
                  view.addSubview(animationView!)
                  // 6. Play animation
                  
                  animationView!.play()
                
                let txt1 = UILabel.init(frame: CGRect(x:32,y:animationView!.frame.maxY+20,width:scrollWidth-64,height:30))
                txt1.textAlignment = .center
                txt1.font = UIFont.boldSystemFont(ofSize: 18.0)
                txt1.text = titles[index]
                txt1.adjustsFontSizeToFitWidth = true
                txt1.numberOfLines = 0
                txt1.textColor = .black

                let txt2 = UILabel.init(frame: CGRect(x:32,y:txt1.frame.maxY+5,width:scrollWidth-64,height:50))
                txt2.textAlignment = .center
                txt2.numberOfLines = 3
                txt2.font = UIFont.systemFont(ofSize: 14.0)
                txt2.text = descs[index]
                txt2.textColor = .black
                
                slide.addSubview(animationView!)
                slide.addSubview(txt1)
                slide.addSubview(txt2)
                scrollView.addSubview(slide)
                
            }
            
            //set width of scrollview to accomodate all the slides
            scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(titles.count), height: scrollHeight)
            
            //disable vertical scroll/bounce
            self.scrollView.contentSize.height = 1.0
            
            //initial state
            pageControl.numberOfPages = titles.count
            pageControl.currentPage = 0
        }
    
    func createAnimation () {
       
    }
    
        
        fileprivate func nextPage(pageNumber: Int) {
            if pageControl?.currentPage != nil {
                pageControl.currentPage = pageControl.currentPage + pageNumber
                scrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((pageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
              //  setButtonAlpha(CGFloat(pageControl!.currentPage))
            }
        }

        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            setIndiactorForCurrentPage()
        }
    
        func setIndiactorForCurrentPage()  {
            let page = (scrollView?.contentOffset.x)!/scrollWidth
            pageControl?.currentPage = Int(page)
          //  setButtonAlpha(page)
        }

}
