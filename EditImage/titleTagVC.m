//
//  titleTagVC.m
//  EditImage
//
//  Created ysj on 16/2/2.
//  Copyright © 2016年 ysj. All rights reserved.
//

#import "titleTagVC.h"
#import "pch.h"
@interface titleTagVC (){
    
    UITextField *textField;
    
    UIView *viewContent;

}

//@property (nonatomic, strong) UITextField *searchField;

@end

@implementation titleTagVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *item =[[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(enter)];
    self.navigationItem.rightBarButtonItem=item;
    
     viewContent = [[UIView alloc] initWithFrame:(CGRect){0,0,kWindowWidth,kWindowHeight-64}];
    
     viewContent.backgroundColor = [UIColor whiteColor];
    
    
    
    textField = [[UITextField alloc] initWithFrame:(CGRect){40,80,kWindowWidth-60,40}];
    
    textField.backgroundColor = [UIColor redColor];
    
    [viewContent addSubview:textField];
    
    [self.view addSubview:viewContent];
    
}

//确定按钮
- (void) enter {
    
//    _block([[self textField]text]);
    
    _block([textField text]);
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end