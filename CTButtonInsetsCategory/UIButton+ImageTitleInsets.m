//
//  UIButton+ImageTitleInsets.m
//  SimuStock
//
//  Created by changchentao on 16/5/16.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "UIButton+ImageTitleInsets.h"
#import <objc/runtime.h>

@implementation UIButton (ImageTitleInsets)

//给category添加属性
- (void)setImageRect:(CGRect)imageRect{
    objc_setAssociatedObject(self, @selector(imageRect), [NSValue valueWithCGRect:imageRect], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGRect)imageRect{
    return [objc_getAssociatedObject(self,_cmd) CGRectValue];
}

- (void)setTitleRect:(CGRect)titleRect{
    objc_setAssociatedObject(self, @selector(titleRect), [NSValue valueWithCGRect:titleRect], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGRect)titleRect{
    return [objc_getAssociatedObject(self, _cmd) CGRectValue];
}

//load方法中调用实现替换方法
+ (void)load{
    
    [self swizzleInstanceMethod:[self class] originalSelector:@selector(imageRectForContentRect:) swizzleSelector:@selector(swizzle_imageRectForContent:)];
    [self swizzleInstanceMethod:[self class] originalSelector:@selector(titleRectForContentRect:) swizzleSelector:@selector(swizzle_titleRectForContent:)];
    
}

+ (void)swizzleInstanceMethod:(Class)class originalSelector:(SEL)originalSelector swizzleSelector:(SEL)swizzleSelector{
    
    Method origin_method = class_getInstanceMethod(class, originalSelector);
    Method target_method = class_getInstanceMethod(class, swizzleSelector);

    method_exchangeImplementations(target_method, origin_method);
}

//实现自己的方法
- (CGRect)swizzle_imageRectForContent:(CGRect)contentRect{
    if (!CGRectEqualToRect(self.imageRect, CGRectZero)) {
        return self.imageRect;
    }
    
    return [self swizzle_imageRectForContent:contentRect];
}

- (CGRect)swizzle_titleRectForContent:(CGRect)contentRect{
    if (!CGRectEqualToRect(self.titleRect, CGRectZero)) {
        return self.titleRect;
    }
    
    return [self swizzle_titleRectForContent:contentRect];
}

@end
