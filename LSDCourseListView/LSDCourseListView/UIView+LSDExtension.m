//
//  UIView+LSDExtension.m
//  yizhuang
//
//  Created by 神州锐达 on 2017/5/25.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#import "UIView+LSDExtension.h"

@implementation UIView (LSDExtension)

+(instancetype)lsd_loadXib{

    NSString *className = NSStringFromClass(self);
    NSString *xibName = [NSString stringWithFormat:@"%@Xib",className];
    return KLoadXibView(xibName);
    
}

@end
