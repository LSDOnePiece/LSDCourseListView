//
//  ViewController.m
//  LSDCourseListView
//
//  Created by 神州锐达 on 2017/6/4.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#import "ViewController.h"
#import "LSDCourseListView.h"
@interface ViewController ()

///
@property(strong,nonatomic)LSDCourseListView *courseListView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self.view addSubview:self.courseListView];
    
    self.courseListView.frame = CGRectMake(0, 64, ScreenWidth, ScreenHeight);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(LSDCourseListView *)courseListView{

    if (_courseListView == nil) {
        _courseListView = [[LSDCourseListView alloc]init];
        _courseListView.courseListWidth = 100;
    }
    return _courseListView;
}

@end
