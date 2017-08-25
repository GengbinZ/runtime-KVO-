//
//  NSObject+KVO.m
//  自定义KVO
//
//  Created by zgbin on 2017/8/15.
//  Copyright © 2017年 zgbin. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/message.h>

@implementation NSObject (KVO)
- (void)FF_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context{
    /*
     1.动态添加一个类
     */
    NSString * oldClassName = NSStringFromClass([self class]);
    NSString * newClassName = [@"FFKVO_" stringByAppendingString:oldClassName];
    const char *newName = [newClassName UTF8String];
    //定义一个类
    Class MyClass = objc_allocateClassPair([self class], newName, 0);
    
    //重写setAge(动态添加方法)
    class_addMethod(MyClass, @selector(setAge:), (IMP)setAge, "");
    
    //注册这个类
    objc_registerClassPair(MyClass);
    
    //改变isa指针
    object_setClass(self, MyClass);
    
}

//有默认参数
void setAge(id self, SEL _cmd, int age){
    
    
    id class = [self class];
    //让自己指向父类
    object_setClass(self, class_getSuperclass([self class]));
    objc_msgSend(self, @selector(setAge:),age);
    object_setClass(self, class);
    
    NSLog(@"哥们来了");
    
}

@end
