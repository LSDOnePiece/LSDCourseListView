//
//  LSDTimeTableViewCell.m
//  LSDCourseListView
//
//  Created by 神州锐达 on 2017/6/4.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#import "LSDTimeTableViewCell.h"

@interface LSDTimeTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *courseTimeLabel;

@end

@implementation LSDTimeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
    self.backgroundColor = RGB(245, 245, 245);

}

-(void)configureCellWithModel:(id)model indexPath:(NSIndexPath *)indexPath{

    self.courseTimeLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row + 1];
    
    self.timeLabel.text = @"08:00";
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
