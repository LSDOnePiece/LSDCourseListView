//
//  LSDCourseListView.h
//  LSDCourseListView
//
//  Created by 神州锐达 on 2017/6/4.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSDCourseListView;
@protocol LSDCourseListViewDelegate <NSObject>
@optional
- (void)courseListView:(LSDCourseListView *)courseListView didSelectedCourse:(id)course;
@end

@protocol LSDCourseListViewDataSource <NSObject>
@required
/** 设置课程数据，必须实现 */
- (NSArray *)courseForCourseListView:(LSDCourseListView *)courseListView;
@end


@interface LSDCourseListView : UIView

/** 数据源 */
@property (nonatomic, weak)  id<LSDCourseListViewDataSource> dataSource;
/** 代理 */
@property (nonatomic, weak)  id<LSDCourseListViewDelegate> delegate;
#pragma mark IU相关


/** 行高，默认100 */
@property (nonatomic, assign) CGFloat itemHeight;
/** 左侧时间tableView的宽度，默认50 */
@property (nonatomic, assign) CGFloat timeTableWidth;
/** 每列课程的宽度，默认50，选中的列为1.5倍 */
@property (nonatomic, assign) CGFloat courseListWidth;
/** 每天最大节数，默认14 */
@property (nonatomic, assign) NSUInteger maxCourseCount;
/** 被选中日期的索引，默认1（1~7，代表一周中 周一~周日） */
@property (nonatomic, assign) NSUInteger selectedIndex;
/** 顶部选项卡背景颜色 默认白色 */
@property (nonatomic, strong) UIColor *topBarBgColor;
/** 顶部选项卡高度 默认50 */
@property (nonatomic, assign) CGFloat headerItemHeight;
/** 顶部选项卡选中背景颜色 */
@property (nonatomic, strong) UIColor *headerItemSeletedBgColor;
/** 顶部选项卡未选中背景颜色 */
@property (nonatomic, strong) UIColor *headerItemNoSeletedBgColor;

/** 刷新 */
- (void)reloadData;

@end
