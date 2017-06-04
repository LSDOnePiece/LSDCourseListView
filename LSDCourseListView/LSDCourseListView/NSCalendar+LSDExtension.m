//
//  NSCalendar+LSDExtension.m
//  LSDCourseListView
//
//  Created by 神州锐达 on 2017/6/4.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#import "NSCalendar+LSDExtension.h"

@implementation NSCalendar (LSDExtension)


+(NSArray *)getCurrentWeekDateArray{

    NSMutableArray *muarray = [NSMutableArray array];
    
    NSDate *now = [NSDate date];

    NSCalendar *calendar = [NSCalendar currentCalendar];

    NSDateComponents *comp = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday
                                         fromDate:now];
    // 得到星期几// 1(星期天) 2(星期二) 3(星期三) 4(星期四) 5(星期五) 6(星期六) 7(星期天)
    NSInteger weekDay = [comp weekday];
    // 得到几号
//    NSInteger day = [comp day];

    NSDate *firstDayOfWeek,*secondDayOfWeek,*thirdDayOfWeek,*fourDayOfWeek,*fiveDayOfWeek,*sixDayOfWeek,*sevenDayOfWeek;
   
    ///当前时间戳
    NSTimeInterval nowInterval =  [now timeIntervalSince1970];
    
    NSTimeInterval firstSeconds ,secondSeconds ,thirdSeconds ,fourSeconds ,fiveSeconds ,sixSeconds ,sevenSeconds;
    
    switch (weekDay) {
        case 1:{///周日
        
             firstSeconds = 6*24*60*60;
             secondSeconds = 5*24*60*60;
             thirdSeconds = 4*24*60*60;
             fourSeconds = 3*24*60*60;
             fiveSeconds = 2*24*60*60;
             sixSeconds = 1*24*60*60;
             sevenSeconds = 0*24*60*60;
          firstDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - firstSeconds];
          secondDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - secondSeconds];
            thirdDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - thirdSeconds];
            fourDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - fourSeconds];
            fiveDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - fiveSeconds];
            sixDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - sixSeconds];
            sevenDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - sevenSeconds];
            
        }
            break;
        case 2:{///周一
            firstSeconds = 0*24*60*60;
            secondSeconds = 1*24*60*60;
            thirdSeconds = 2*24*60*60;
            fourSeconds = 3*24*60*60;
            fiveSeconds = 4*24*60*60;
            sixSeconds = 5*24*60*60;
            sevenSeconds = 6*24*60*60;
            firstDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - firstSeconds];
            secondDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + secondSeconds];
            thirdDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + thirdSeconds];
            fourDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + fourSeconds];
            fiveDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + fiveSeconds];
            sixDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + sixSeconds];
            sevenDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + sevenSeconds];
        }
            break;
        case 3:{///周二
            firstSeconds = 1*24*60*60;
            secondSeconds = 0*24*60*60;
            thirdSeconds = 1*24*60*60;
            fourSeconds = 2*24*60*60;
            fiveSeconds = 3*24*60*60;
            sixSeconds = 4*24*60*60;
            sevenSeconds = 5*24*60*60;
            firstDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - firstSeconds];
            secondDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - secondSeconds];
            thirdDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + thirdSeconds];
            fourDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + fourSeconds];
            fiveDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + fiveSeconds];
            sixDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + sixSeconds];
            sevenDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + sevenSeconds];
        }
            break;
        case 4:{///周三
            firstSeconds = 2*24*60*60;
            secondSeconds = 1*24*60*60;
            thirdSeconds = 0*24*60*60;
            fourSeconds = 1*24*60*60;
            fiveSeconds = 2*24*60*60;
            sixSeconds = 3*24*60*60;
            sevenSeconds = 4*24*60*60;
            firstDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - firstSeconds];
            secondDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - secondSeconds];
            thirdDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - thirdSeconds];
            fourDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + fourSeconds];
            fiveDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + fiveSeconds];
            sixDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + sixSeconds];
            sevenDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + sevenSeconds];
        }
            break;
        case 5:{///周四
            firstSeconds = 3*24*60*60;
            secondSeconds = 2*24*60*60;
            thirdSeconds = 1*24*60*60;
            fourSeconds = 0*24*60*60;
            fiveSeconds = 1*24*60*60;
            sixSeconds = 2*24*60*60;
            sevenSeconds = 3*24*60*60;
            firstDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - firstSeconds];
            secondDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - secondSeconds];
            thirdDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - thirdSeconds];
            fourDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - fourSeconds];
            fiveDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + fiveSeconds];
            sixDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + sixSeconds];
            sevenDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + sevenSeconds];
        }
            break;
        case 6:{///周五
            firstSeconds = 4*24*60*60;
            secondSeconds = 3*24*60*60;
            thirdSeconds = 2*24*60*60;
            fourSeconds = 1*24*60*60;
            fiveSeconds = 0*24*60*60;
            sixSeconds = 1*24*60*60;
            sevenSeconds = 2*24*60*60;
            firstDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - firstSeconds];
            secondDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - secondSeconds];
            thirdDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - thirdSeconds];
            fourDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - fourSeconds];
            fiveDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - fiveSeconds];
            sixDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + sixSeconds];
            sevenDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + sevenSeconds];
        }
            break;
        case 7:{///周六
            firstSeconds = 5*24*60*60;
            secondSeconds = 4*24*60*60;
            thirdSeconds = 3*24*60*60;
            fourSeconds = 2*24*60*60;
            fiveSeconds = 1*24*60*60;
            sixSeconds = 0*24*60*60;
            sevenSeconds = 1*24*60*60;
            firstDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - firstSeconds];
            secondDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - secondSeconds];
            thirdDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - thirdSeconds];
            fourDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - fourSeconds];
            fiveDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - fiveSeconds];
            sixDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval - sixSeconds];
            sevenDayOfWeek = [NSDate dateWithTimeIntervalSince1970:nowInterval + sevenSeconds];
        }
            break;
            
            
        default:
            break;
    }

    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"M月dd日"];
    
    [muarray addObject:[formater stringFromDate:firstDayOfWeek]];
    [muarray addObject:[formater stringFromDate:secondDayOfWeek]];
    [muarray addObject:[formater stringFromDate:thirdDayOfWeek]];
    [muarray addObject:[formater stringFromDate:fourDayOfWeek]];
    [muarray addObject:[formater stringFromDate:fiveDayOfWeek]];
    [muarray addObject:[formater stringFromDate:sixDayOfWeek]];
    [muarray addObject:[formater stringFromDate:sevenDayOfWeek]];
  
    return  muarray.copy;
}

@end
