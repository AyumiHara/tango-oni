//
//  QuestionViewController.swift
//  tango oni
//
//  Created by 原 あゆみ on 2018/04/10.
//  Copyright © 2018年 原あゆみ. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    var isAnswerd: Bool = false
    var wordArray: [Dictionary<String,String>] = []
    var shuffledWordArray: [Dictionary<String,String>]  = []
    var nowNumber: Int  = 0
    
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerLabel.text = ""

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String,String>]
        shuffle()
        questionLabel.text = shuffledWordArray[nowNumber]["english"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func shuffle() {
        while wordArray.count > 0 {
            let index = Int(arc4random())%wordArray.count
            shuffledWordArray.append(wordArray[index])
            wordArray.remove(at: index)
        }
    }
    
    @IBAction func nextButtonTapped() {
        if isAnswerd {
            nowNumber += 1
            answerLabel.text = ""
            
            if nowNumber < shuffledWordArray.count{
                questionLabel.text = shuffledWordArray[nowNumber]["english"]
                isAnswerd = false
                nextButton.setTitle("答えを表示", for: .normal)
                
            } else {
                self.performSegue(withIdentifier: "toFinishView", sender: nil)
                
            }
        } else {
            answerLabel.text = shuffledWordArray[nowNumber]["japanese"]
            isAnswerd = true
            nextButton.setTitle("次へ", for: .normal)
        
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
