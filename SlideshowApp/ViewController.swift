//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 鈴木啓弥 on 2020/11/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    // 画像のインデックス
    var imageIndex: Int = 0

    // タイマー
    var timer: Timer!

    // 画像のリスト
    var imageArray:[UIImage] = [
        UIImage(named: "img_1")!,
        UIImage(named: "img_2")!,
        UIImage(named: "img_3")!,
        UIImage(named: "img_4")!,
        UIImage(named: "img_5")!,
        UIImage(named: "img_6")!,
        UIImage(named: "img_7")!,
        UIImage(named: "img_8")!,
        UIImage(named: "img_9")!,
        UIImage(named: "img_10")!,
        UIImage(named: "img_11")!,
        UIImage(named: "img_12")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageArray[imageIndex]

        imageView.isUserInteractionEnabled = true
    }

    // 画像選択時の処理
    @IBAction func tapAction(_ sender: Any) {
        // スライドショーが動いていたら止める
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }

        // storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!

        // 遷移先ViewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "SelectImageViewController") as! SelectImageViewController

        nextView.image = imageArray[imageIndex]
        // 画面遷移
        self.present(nextView, animated: true, completion: nil)
    }

    // 次処理
    @IBAction func nextButton(_ sender: Any) {
        if (self.timer == nil) {
            imageIndex += 1
            if(imageIndex > imageArray.count - 1) {
                imageIndex = 0
            }
            imageView.image = imageArray[imageIndex]
        }
    }

    // 戻る処理
    @IBAction func backButton(_ sender: Any) {
        if (self.timer == nil) {
            imageIndex -= 1
            if(imageIndex < 0) {
                imageIndex = imageArray.count - 1
            }
            imageView.image = imageArray[imageIndex]
        }
    }

    // 再生ボタン IBAction
    @IBAction func startSlideshow(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateImage(_:)), userInfo: nil, repeats: true)
        }
    }

    // 画像更新
    @objc func updateImage(_ timer: Timer) {
        imageIndex += 1
        if(imageIndex > imageArray.count - 1) {
            imageIndex = 0
        }
        imageView.image = imageArray[imageIndex]
    }

    // 一時停止ボタン IBAction
    @IBAction func pauseSlideshow(_ sender: Any) {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
    }
}

