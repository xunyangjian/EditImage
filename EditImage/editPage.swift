//
//  editPage.swift
//  EditImage
//
//  Created by 景娜娜 on 16/1/25.
//  Copyright © 2016年 ysj. All rights reserved.
//

import UIKit

class editPage : UIViewController{

    var tagEditorImageView  : YXLTagEditorImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
    
         tagEditorImageView = YXLTagEditorImageView(image: UIImage(named: "2011102267331457.jpg"))
        
        tagEditorImageView.viewC = self
        
        tagEditorImageView.userInteractionEnabled = true
        
        self.view.addSubview(tagEditorImageView)

        
        tagEditorImageView.mas_makeConstraints { (make:MASConstraintMaker!) -> Void in
                make.edges.equalTo()
            
        }
    
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //合成图片
    @IBAction func exportImage(){
    
        let array = self.tagEditorImageView.popTagModel()
    
        let dic : NSDictionary = array[0]  as! NSDictionary
        let str  = dic["point"] as! NSString
            
         print(str)
        
        //拆分坐标
        let strRes = str.componentsSeparatedByString(",")
        
        let x  = NSString(string: strRes[0]).floatValue
        let y = NSString(string: strRes[1]).floatValue
        
        // 改行して２行で表示
        let text = dic["text"]
        
        let font = UIFont.boldSystemFontOfSize(40)
        
        //屏幕尺寸
        let appFrameSize: CGSize = UIScreen.mainScreen().bounds.size
        
        let screenWidth = appFrameSize.width
        let screenHeight = appFrameSize.height
        
        //合成背景图片
        let imageEmmy:UIImage! = UIImage(named:"2011102267331457.jpg")
        //宽；高
        let imageWidth = imageEmmy.size.width
        let imageHeight = imageEmmy.size.height
        //合成区域
        let rect = CGRectMake(0, 0, imageWidth, imageHeight)
        
        //添加图片
        let imageHandbag:UIImage! = UIImage(named:"textTagAnti@3x.png")
        
        // 宽；高
        let imageHandbagWidth = imageHandbag.size.width
        let imageHandbagHeight = imageHandbag.size.height
        
        
        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        // Context 開始
        // 一番大きい画像サイズでContextを開く
        UIGraphicsBeginImageContext(imageEmmy.size)
        
        // EmmyをUIImageのdrawInRectメソッドでレンダリング
        imageEmmy.drawInRect(rect)
        
        // テキストの描画領域
        let textRect  = CGRectMake(CGFloat(x), CGFloat(y), imageWidth-250, 120)
        
        let textStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        
        let textFontAttributes = [
            NSFontAttributeName: font,
            NSForegroundColorAttributeName: UIColor.yellowColor(),
            NSParagraphStyleAttributeName: textStyle
        ]
        
        // テキストをdrawInRectメソッドでレンダリング
        text!.drawInRect(textRect, withAttributes: textFontAttributes)
        //text.drawInRe
        
        // ハンドバッグの描画領域
        let handbagRect = CGRectMake(imageWidth/2+100, imageHeight/2+50, imageHandbagWidth*3/2, imageHandbagHeight*3/2)
        
        // ハンドバッグをdrawInRectメソッドでレンダリング
        imageHandbag.drawInRect(handbagRect)
        
        // Context に描画された画像を新しく設定
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        // Context 終了
        UIGraphicsEndImageContext()
        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        
        
        // UIImageView インスタンス生成
        let imageView = UIImageView()
        imageView.image = newImage
        
        // 画像サイズをスクリーン幅に合わせる, scaling
        let scale = screenWidth / imageWidth
        let newRect = CGRectMake(0, 0, imageWidth*scale, imageHeight*scale)
        
        // ImageView frame をCGRectMakeで作った矩形に合わせる
        imageView.frame = newRect
        
        // 画像の中心をスクリーンの中心にする
        imageView.center = CGPointMake(screenWidth/2, screenHeight/2)
        
        // view に ImageView を追加する
        //self.view.addSubview(imageView)
        
        self.tagEditorImageView.imagePreviews.image = newImage
        
    }
    
    
}
