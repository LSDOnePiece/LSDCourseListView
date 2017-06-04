//
//  LSDHeaderItemView.h
//  LSDCourseListView
//
//  Created by 神州锐达 on 2017/6/4.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LSDHeaderItemViewDelegate <NSObject>

@optional
-(void)headerItemViewDidBtnClick:(UIButton *)sender;


@end

@interface LSDHeaderItemView : UIView

///
@property(assign,nonatomic)NSInteger btnTag;

///
@property(assign,nonatomic)BOOL TriangleImageViewHidden;

///
@property(weak,nonatomic)id<LSDHeaderItemViewDelegate> delegate;

///
@property(copy,nonatomic)NSString *dateTitle;
@end
