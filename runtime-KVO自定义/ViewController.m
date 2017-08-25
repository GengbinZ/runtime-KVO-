//
//  ViewController.m
//  自定义KVO
//
//  Created by zgbin on 2017/8/15.
//  Copyright © 2017年 zgbin. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+KVO.h"

@interface ViewController ()
@property(nonatomic,strong)Person *p;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //添加观察者
    _p = [[Person alloc] init];
    [_p FF_addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _p.age = 100;
    // Dispose of any resources that can be recreated.
}


@end
