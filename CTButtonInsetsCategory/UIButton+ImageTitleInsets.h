//
//  UIButton+ImageTitleInsets.h
//  SimuStock
//
//  Created by changchentao on 16/5/16.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  自由设置button的iamgeview和titlelabel
 */
@interface UIButton (ImageTitleInsets)

/** button的图片rect */
@property(nonatomic, assign) CGRect imageRect;
/** button的titlerect */
@property(nonatomic, assign) CGRect titleRect;

+ (void)swizzleInstanceMethod:(Class)class originalSelector:(SEL)originalSelector swizzleSelector:(SEL)swizzleSelector;

@end
