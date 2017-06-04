//
//  LSDHeaderItemView.m
//  LSDCourseListView
//
//  Created by 神州锐达 on 2017/6/4.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#import "LSDHeaderItemView.h"

@interface LSDHeaderItemView ()
@property (weak, nonatomic) IBOutlet UILabel *weekDayLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *triangleImageView;
@property (weak, nonatomic) IBOutlet UIButton *btn;



@end


@implementation LSDHeaderItemView



-(void)awakeFromNib{

    [super awakeFromNib];
 
}

-(void)setBtnTag:(NSInteger)btnTag{

    _btnTag = btnTag;
    
    self.btn.tag = btnTag;
    

    
    switch (btnTag) {
        case 1:{
        self.weekDayLabel.text = @"周一";
           
        }
            break;
        case 2:{
            self.weekDayLabel.text = @"周二";
        }
            break;
        case 3:{
            self.weekDayLabel.text = @"周三";
        }
            break;
        case 4:{
            self.weekDayLabel.text = @"周四";
        }
            break;
        case 5:{
            self.weekDayLabel.text = @"周五";
        }
            break;
        case 6:{
            self.weekDayLabel.text = @"周六";
        }
            break;
        case 7:{
            self.weekDayLabel.text = @"周日";
        }
            break;
            
        default:
            break;
    }
 
}

-(void)setDateTitle:(NSString *)dateTitle{

    _dateTitle = dateTitle;
    
    self.dateLabel.text = dateTitle;
}

- (IBAction)btnClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(headerItemViewDidBtnClick:)]) {
        [self.delegate headerItemViewDidBtnClick:sender];
    }
}

-(void)setTriangleImageViewHidden:(BOOL)TriangleImageViewHidden{

    if (TriangleImageViewHidden == YES) {
        self.triangleImageView.hidden = YES;
    }else{
        self.triangleImageView.hidden = NO;
    }
}


@end
