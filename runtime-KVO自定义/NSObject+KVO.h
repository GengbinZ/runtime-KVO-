//
//  NSObject+KVO.h
//  自定义KVO
//
//  Created by zgbin on 2017/8/15.
//  Copyright © 2017年 zgbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)
- (void)FF_addObserver:(NSObject *_Nullable)observer forKeyPath:(NSString *_Nullable)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;
@end
