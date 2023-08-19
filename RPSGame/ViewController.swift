//
//  ViewController.swift
//  RPSGame
//
//  Created by Jaesuk Lee on 2023/08/19.
//

import UIKit

class ViewController: UIViewController {

    // 변수
    
    // 변하지 않으면 속성을 건드릴 필요가 없다
    @IBOutlet weak var mainLabel: UILabel!
    
    // 컴퓨터가 정하는 이미지
    @IBOutlet weak var comImageView: UIImageView!
    
    // 내가 정하는 이미지
    @IBOutlet weak var myImageView: UIImageView!
    
    // 컴퓨터가 정하는 레이블
    @IBOutlet weak var comChoiceLabel: UILabel!
    
    // 내가 정하는 레이블
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    // you can save it here, but you would need to reset everytime
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!

    var myChoice: Rps = Rps.rock
    
    // 함수 / 메서드
    // 앱의 화면에 들어오면 처음 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 1. 첫번째/두번째 이미지뷰에 준비(묵) 이미지를 띄워야 함
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png") // 이렇게 이미지를 불러올수 있다
        
        // 2. 첫번째/두번째 레이블에 "준비" 라고 문자열을 띄워야 함
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"

    }

    // 함수 / 메서드
    // 버튼 하나에 버튼을 연결시킨다
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 가위 / 바위/ 보 를 선택해서 그 정보를 저장해야 된다
        // 현재 버튼의 title 를 알려준다 -> 가위를 누르면 "가위"
//        guard let title = sender.currentTitle else {
//            return
//        }
        // 버튼의 문자를 가져옴
        let title = sender.currentTitle!
        
        switch title {
        case "가위" :
            // 가위 열거형을 만들어서 저장
            myChoice = Rps.scissors
//            print(myChoice)
        case "바위" :
            // 바위 열거형을 만들어서 저장
            myChoice = Rps.rock
//            print(myChoice)
        case "보" :
            // 보 열거형을 만들어서 저장
            myChoice = Rps.paper
//            print(myChoice)
        default:
            break
        }
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 1. 컴퓨터가 랜덤 선택한 것을 이미지뷰에 표시
        // 2. 컴퓨터가 랜덤 선택한 것을 레이블에 표시
        var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
        print("comChoice: \(comChoice)")
        
        switch comChoice {
        case Rps.rock:
            comImageView.image = #imageLiteral(resourceName: "ready")
            comChoiceLabel.text = "바위"
        case Rps.paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        case Rps.scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        }
        
        // 3. 내가 선택한 것을 이미지뷰에 표시
        // 4. 내가 선택한 것을 레이블에 표시
        switch myChoice {
        case Rps.rock:
            myImageView.image = #imageLiteral(resourceName: "ready")
            myChoiceLabel.text = "바위"
        case Rps.paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case Rps.scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        }
        
        // 5. 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 이겼는지 / 졌는지 판단/표시
        if comChoice == myChoice {
            mainLabel.text = "비겼다"
        } else if comChoice == .rock && myChoice == .paper {
            mainLabel.text = "이겼다"
        } else if comChoice == .paper && myChoice == .scissors {
            mainLabel.text = "이겼다"
        } else if comChoice == .scissors && myChoice == .rock {
            mainLabel.text = "이겼다"
        } else {
            mainLabel.text = "졌다"
        }
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1. 컴퓨터가 다시 준비 이미지뷰에 표시
        // 2. 컴퓨터가 랜덤 준비 레이블에 표시
        comImageView.image = #imageLiteral(resourceName: "rock")
        comChoiceLabel.text = "준비"
        
        // 3. 내 선택 이미지뷰에도 준비 이미지를 표시
        // 4. 내 선택 레이블에도 준비 문자열 표시
        
        myImageView.image = #imageLiteral(resourceName: "rock")
        myChoiceLabel.text = "준비"
        
        
        // 5. 메인 레이블 '선택하세요' 표시
        mainLabel.text = "선택하세요"
        
        // 6. 컴퓨터가 다시 랜덤 가위 바위 보를 선택하고 저장
        comChoice = Rps(rawValue: Int.random(in: 0...2))!   // ! means optional 를 강제로 없애주는 
        
    }
    
    
}

// a separate enum file has been created 
//enum RPS{
//    case rock
//    case paper
//    case scissors
//}
