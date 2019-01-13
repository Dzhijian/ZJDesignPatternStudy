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

#import "TetrisMachine.h"
#import "TetrisMachineManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 原理案例
    [self commandPatternTheoryTest];
    
    // 俄罗斯方块具体案例
    [self commandPatternTMTest];
}


#pragma mark - 命令模式 - 俄罗斯方块具体案例
-(void)commandPatternTMTest{
    NSLog(@"\n\n********************** 命令模式 - 俄罗斯方块具体案例 *************************\n");
    // 创建接收者
    TetrisMachine *tm = [[TetrisMachine alloc]init];
    
    // 创建命令对象
    TMToLeftCommand *left = [[TMToLeftCommand alloc]initWithTetrisMachine:tm];
    TMToRightCommand *right = [[TMToRightCommand alloc]initWithTetriMachine:tm];
    TMToTransformCommand *transform = [[TMToTransformCommand alloc]initWithTetrisMachine:tm];
    
    // 创建请求者对象
    TetrisMachineManager *tmManager = [[TetrisMachineManager alloc]initWithToLeftCommand:left
                                                                            rightCommand:right
                                                                        transformCommand:transform];
    [tmManager toLeftCommand];
    [tmManager toRightCommand];
    [tmManager toTransformCommand];
    
    
}

#pragma mark - 命令模式 - 原理案例
-(void)commandPatternTheoryTest{
     NSLog(@"\n\n********************** 命令模式 - 原理案例 *************************\n");
    // 1. 创建接受者
    Receiver *receiver = [[Receiver alloc]init];
    
    // 2. 创建命令对象
    ConcreteCommand *concreteCom = [[ConcreteCommand alloc]initWithRecevicer:receiver];
    
    // 3. 创建请求者
    Invoker *invoker = [[Invoker alloc]initConcreteCommand:concreteCom];
    
    // 4. 执行命令
    [invoker concreteCommand];
}

@end
