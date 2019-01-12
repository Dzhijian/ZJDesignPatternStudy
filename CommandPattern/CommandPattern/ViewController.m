//
//  ViewController.m
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/10.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import "ViewController.h"
#import "Receiver.h"
#import "ConcreteCommand.h"
#import "Invoker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 原理案例
    [self commandPatternTheoryTest];
}

#pragma mark - 命令模式-原理案例
-(void)commandPatternTheoryTest{
    
    //  创建接受者
    Receiver *receiver = [[Receiver alloc]init];
    
    // 创建命令对象
    ConcreteCommand *concreteCom = [[ConcreteCommand alloc]initWithRecevicer:receiver];
    
    // 创建请求者
    Invoker *invoker = [[Invoker alloc]initConcreteCommand:concreteCom];
    
    // 执行命令
    [invoker concreteCommand];
}

@end
