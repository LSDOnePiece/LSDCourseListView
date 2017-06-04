//
//  LSDCourseTableViewCell.h
//  LSDCourseListView
//
//  Created by 神州锐达 on 2017/6/4.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSDCourseListModel.h"
@interface LSDCourseTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *courseNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *classRoomLabel;
///
@property(strong,nonatomic)UIColor *bgColor;

@end
