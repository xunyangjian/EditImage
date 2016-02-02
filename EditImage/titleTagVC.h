//
//  titleTagVC.h
//  EditImage
//
//  Created by ysj on 16/2/2.
//  Copyright © 2016年 ysj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface titleTagVC : UIViewController

@property (nonatomic ,copy) void (^block)(NSString *text);


@end