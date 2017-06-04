//
//  LSDCourseListView.m
//  LSDCourseListView
//
//  Created by 神州锐达 on 2017/6/4.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#import "LSDCourseListView.h"
#import "LSDTimeTableViewCell.h"
#import "LSDHeaderItemView.h"
#import "LSDCourseTableViewCell.h"
#define MaxDay 7

@interface LSDCourseListView ()<UITableViewDataSource, UITableViewDelegate,LSDHeaderItemViewDelegate>
/** 顶部选项卡 */
@property (nonatomic, weak)   UIScrollView *topBar;
/** 顶部选项卡的ContentView */
@property (nonatomic, weak)   UIView *topBarContentView;
/** 顶部选项卡中的按钮 */
@property (nonatomic, strong) NSArray *topBarBtnArr;

/** 时间TableView */
@property (nonatomic, weak)   UITableView *timeTableView;

/** 上下滚动的ScrollView */
@property (nonatomic, weak)   UIScrollView *upDownScrollView;

/** 左右滚动的ScrollView */
@property (nonatomic, weak)   UIScrollView *leftRightScrollView;

/** 课程Table列表 */
@property (nonatomic, strong) NSArray *courseTableArr;

/** 亮色集合 */
@property (nonatomic, strong) NSArray *lightColorArr;

/** 课程数据 */
@property (nonatomic, strong) NSArray *courseDataArr;


/** 当前周的日期数组 */
@property(strong,nonatomic)NSArray *currentWeekDateArray;

@end

@implementation LSDCourseListView

#pragma mark - lazy
- (NSArray *)lightColorArr{
    if (!_lightColorArr) {
        _lightColorArr = @[
                           RGB(39, 201, 155),
                           RGB(146, 196, 40),
                           RGB(253, 185, 46),
                           RGB(112, 161, 246),
                           RGB(246, 126, 140),
                           RGB(185, 140, 221),
                           RGB(30, 180, 235)
                         ];
    }
    return _lightColorArr;
}

-(NSArray *)currentWeekDateArray{
    
    if (_currentWeekDateArray == nil) {
         _currentWeekDateArray =  [NSCalendar getCurrentWeekDateArray];
    }
    return _currentWeekDateArray;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}


- (void)setup{
    /*=============================== 初始化变量 ==============================*/
    _itemHeight = 100;
    _timeTableWidth = 50;
    _headerItemHeight = 50;
    _courseListWidth = 0;
    _maxCourseCount = 14;
    _selectedIndex = [Math getWeekDay];
    _topBarBgColor = _headerItemNoSeletedBgColor?_headerItemNoSeletedBgColor : RGB(245,246,248);
    self.backgroundColor = RGB(245, 245, 245);
    
    /*=============================== 添加控件 ==============================*/
    NSMutableArray *temp;
    
    /** topBar */
    UIScrollView *topBar = [[UIScrollView alloc] init];
    topBar.delegate = self;
    topBar.backgroundColor = _topBarBgColor;
    topBar.showsHorizontalScrollIndicator = NO;
    topBar.bounces = NO;
    [self addSubview:topBar];
    self.topBar = topBar;
#pragma mark -- 顶部标签的frame设置
    topBar.frame = CGRectMake(_timeTableWidth, 0, ScreenWidth, _headerItemHeight);
    
    
    /** topBarContentView */
    UIView *topBarContentView = [[UIView alloc] init];
    topBarContentView.backgroundColor = [UIColor clearColor];
    topBarContentView.clipsToBounds = YES;
    [topBar addSubview:topBarContentView];
    self.topBarContentView = topBarContentView;
    
    
    /** tabBarBtnArr */
    temp = [NSMutableArray array];
    for (int i=0; i<MaxDay; i++) {
        LSDHeaderItemView *headItemView = [LSDHeaderItemView lsd_loadXib];
        headItemView.delegate = self;
        headItemView.btnTag = i+1;
        if(_selectedIndex == i+1){
            headItemView.TriangleImageViewHidden = NO;
            headItemView.backgroundColor = _headerItemSeletedBgColor?_headerItemSeletedBgColor : RGB(229,241,255);
        }else{
            headItemView.TriangleImageViewHidden = YES;
            headItemView.backgroundColor = _headerItemNoSeletedBgColor?_headerItemNoSeletedBgColor : RGB(245,246,248);
        }
        
        headItemView.dateTitle = self.currentWeekDateArray[i];
        
        [topBarContentView addSubview:headItemView];
        [temp addObject:headItemView];
    }
    _topBarBtnArr = temp;
    
    /** upDownScrollView */
    UIScrollView *upDownScrollView = [[UIScrollView alloc] init];
    upDownScrollView.showsVerticalScrollIndicator = NO;
    upDownScrollView.bounces = NO;
    upDownScrollView.backgroundColor = [UIColor blackColor];
    upDownScrollView.delegate = self;
    [self addSubview:upDownScrollView];
    self.upDownScrollView = upDownScrollView;
    
    /** timeTableView */
    UITableView *timeTableView = [[UITableView alloc] init];
    timeTableView.backgroundColor = [UIColor clearColor];

    timeTableView.scrollEnabled = NO;
    timeTableView.delegate = self;
    timeTableView.dataSource = self;
    [upDownScrollView addSubview:timeTableView];
    self.timeTableView = timeTableView;
    
    /** leftRightScrollView */
    UIScrollView *leftRightScrollView = [[UIScrollView alloc] init];
    leftRightScrollView.bounces = NO;
    leftRightScrollView.showsHorizontalScrollIndicator = NO;
    leftRightScrollView.delegate = self;
    [upDownScrollView addSubview:leftRightScrollView];
    self.leftRightScrollView = leftRightScrollView;
    
    /** courseTableArr */
    temp = [NSMutableArray array];
    for (int i=0; i<MaxDay; i++) {
        UITableView *table = [[UITableView alloc] init];
        table.backgroundColor = [UIColor clearColor];
        table.delegate = self;
        table.dataSource = self;
        table.scrollEnabled = NO;
        table.tag = i+1;
        [leftRightScrollView addSubview:table];
        [temp addObject:table];
    }
    _courseTableArr = [NSArray arrayWithArray:temp];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGFloat courseW = _courseListWidth ? _courseListWidth : (width-_timeTableWidth)/(MaxDay+0.5-2);
    CGFloat x,y,w,h;

    _topBarContentView.frame = CGRectMake(0, 0, courseW*(MaxDay+0.5), _headerItemHeight);
    _topBar.contentSize = CGSizeMake(_timeTableWidth + courseW*(MaxDay+0.5), _headerItemHeight);
    
    for (int i=0; i<self.topBarBtnArr.count; i++) {
        
        LSDHeaderItemView *headerItemView = self.topBarBtnArr[i];
        if (i>0) {
            LSDHeaderItemView *preHeaderItemView = self.topBarBtnArr[i-1];
            x = CGRectGetMaxX(preHeaderItemView.frame);
        } else {
            x = 0;
        }
        y=0;
        if (headerItemView.btnTag==_selectedIndex) {
            w = 1.5*courseW;
        } else {
            w = courseW;
        }
        h = _topBarContentView.frame.size.height;
        headerItemView.frame = CGRectMake(x, y, w, h);

    }
    
    _upDownScrollView.frame = CGRectMake(0, CGRectGetMaxY(_topBar.frame), width, height-(CGRectGetMaxY(_topBar.frame) + _topBar.frame.size.height));
    
    NSLog(@"%f",height-_topBar.frame.size.height);
    _upDownScrollView.contentSize = CGSizeMake(0, _maxCourseCount*_itemHeight);

    
    _timeTableView.frame = CGRectMake(0, 0, _timeTableWidth, _itemHeight*_maxCourseCount);
    
    _leftRightScrollView.frame = CGRectMake(_timeTableWidth, 0, width-_timeTableWidth, _timeTableView.frame.size.height);
    _leftRightScrollView.contentSize = CGSizeMake(courseW*(MaxDay+0.5), 0);

    for (int i=0; i<self.courseTableArr.count; i++) {
        UITableView *table = self.courseTableArr[i];
        if (i>0) {
            UITableView *preTable = self.courseTableArr[i-1];
            x = CGRectGetMaxX(preTable.frame);
        } else {
            x = 0;
        }
        y=0;
        if (table.tag==_selectedIndex) {
            w = 1.5*courseW;
        } else {
            w = courseW;
        }
        h = _maxCourseCount*_itemHeight;
        table.frame = CGRectMake(x, y, w, h);
        
    }
    
}


#pragma mark - public
- (void)reloadData{
    [self loadData];
}

#pragma mark - private
- (void)topBarItemClick:(UIButton *)btn{
    _selectedIndex = btn.tag;
    
    [self layoutSubviews];
}

- (void)loadData{

}


#pragma mark - UITableViewDataSource、Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor clearColor];
    return _maxCourseCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if ([tableView isEqual:self.timeTableView]) {
    
    LSDTimeTableViewCell *cell =    [LSDTimeTableViewCell lsd_tableViewCellWithTableView:tableView];
        
    [cell configureCellWithModel:nil indexPath:indexPath];
        
        return cell;
    }else {
    
    LSDCourseTableViewCell *cell = [LSDCourseTableViewCell lsd_tableViewCellWithTableView:tableView];

    #pragma mark -- 测试颜色
    if (indexPath.row %2 == 0) {
        cell.courseNameLabel.text =@"马克思主义基本原理";
        cell.classRoomLabel.text =@"@二教报告厅";
    }else{
        cell.courseNameLabel.text =@"";
        cell.classRoomLabel.text =@"";
    }
        
    cell.bgColor = self.lightColorArr[tableView.tag - 1];
        
    return cell;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return _itemHeight;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:self.timeTableView]) return;
    _selectedIndex = tableView.tag;
    
    for (LSDHeaderItemView *headerItemView in self.topBarBtnArr) {
        if (headerItemView.btnTag == _selectedIndex) {
            headerItemView.TriangleImageViewHidden = NO;
            headerItemView.backgroundColor = _headerItemSeletedBgColor?_headerItemSeletedBgColor : RGB(229,241,255);
        }else{
            headerItemView.TriangleImageViewHidden = YES;
            headerItemView.backgroundColor = _headerItemNoSeletedBgColor?_headerItemNoSeletedBgColor : RGB(245,246,248);
        }
    }
    
    [self layoutSubviews];
    if ([_delegate respondsToSelector:@selector(courseListView:didSelectedCourse:)]) {
        LSDCourseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//        [_delegate courseListView:self didSelectedCourse:cell.course];
    }
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView == self.leftRightScrollView) {
      CGPoint offset = self.leftRightScrollView.contentOffset;
        
        CGFloat x = offset.x;

        self.topBar.contentOffset = CGPointMake(x, 0);
        
    }
    if (scrollView == self.topBar) {
        CGPoint offset = self.topBar.contentOffset;
        
        CGFloat x = offset.x;
        
        self.leftRightScrollView.contentOffset = CGPointMake(x, 0);
    }
    
    
    [self layoutSubviews];
}

#pragma mark -- LSDHeaderItemViewDelegate
-(void)headerItemViewDidBtnClick:(UIButton *)sender{

    for (LSDHeaderItemView *headerItemView in self.topBarBtnArr) {
        if (headerItemView.btnTag == sender.tag) {
            headerItemView.TriangleImageViewHidden = NO;
            headerItemView.backgroundColor = _headerItemSeletedBgColor?_headerItemSeletedBgColor : RGB(229,241,255);
        }else{
            headerItemView.TriangleImageViewHidden = YES;
            headerItemView.backgroundColor = _headerItemNoSeletedBgColor?_headerItemNoSeletedBgColor : RGB(245,246,248);
        }
    }
    _selectedIndex = sender.tag;
    [self layoutSubviews];
    
}

@end
