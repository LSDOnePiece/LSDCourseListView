//
//  LSDCourseTableViewCell.m
//  LSDCourseListView
//
//  Created by 神州锐达 on 2017/6/4.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#import "LSDCourseTableViewCell.h"

@interface LSDCourseTableViewCell ()


@end


@implementation LSDCourseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setBgColor:(UIColor *)bgColor{

    if (self.courseNameLabel.text.length>0) {
        self.backgroundColor = bgColor;
    }else{
    
        self.backgroundColor = RGB(245,246,248);
    }
}

@end
