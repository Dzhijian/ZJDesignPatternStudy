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
#import "DynamicCommandManager.h"
#import "GenericsCommandManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 原理案例
    [self commandPatternTheoryTest];
    
    // 俄罗斯方块具体案例
    [self commandPatternTMTest];
    
    // 动态命令案例
    [self commandPatternDynomicTest];
    
    // 泛型命令案例
    [self commandPatternGenericsTest];
}

#pragma mark - 动态命令案例
-(void)commandPatternGenericsTest{
    NSLog(@"\n\n********************** 命令模式 - 泛型命令案例 *************************\n");
    // 创建接收者
    TetrisMachine *tm = [[TetrisMachine alloc]init];
    // 创建动态命令管理者
    GenericsCommandManager *manager = [[GenericsCommandManager alloc]initWithTetrisMachine:tm];
    
    // 动态添加执行命令
    [manager toLeftCommand];
    [manager toRightCommand];
    [manager toTransformCommand];
    
    // 执行撤销命令
    [manager undoOpreation];
    [manager undoAllOpreation];
}


#pragma mark - 动态命令案例
-(void)commandPatternDynomicTest{
    NSLog(@"\n\n********************** 命令模式 - 动态命令案例 *************************\n");
    // 创建接收者
    TetrisMachine *tm = [[TetrisMachine alloc]init];
    // 创建动态命令管理者
    DynamicCommandManager *manager = [[DynamicCommandManager alloc]initWithTetrisMachine:tm];
    
    // 动态添加执行命令
    [manager toLeftCommand];
    [manager toRightCommand];
    [manager toTransformCommand];
    
    // 执行撤销命令
    [manager undoOpreation];
    [manager undoAllOpreation];
}


#pragma mark - 命令模式 - 俄罗斯方块具体案例
-(void)commandPatternTMTest{
    NSLog(@"\n\n********************** 命令模式 - 俄罗斯方块具体案例 *************************\n");
    // 创建接收者
    TetrisMachine *tm = [[TetrisMachine alloc]init];
    
    // 创建命令对象
    TMToLeftCommand *left = [[TMToLeftCommand alloc]initWithTetrisMachine:tm];
    TMToRightCommand *right = [[TMToRightCommand alloc]initWithTetrisMachine:tm];
    TMToTransformCommand *transform = [[TMToTransformCommand alloc]initWithTetrisMachine:tm];
    
    // 创建请求者对象
    TetrisMachineManager *tmManager = [[TetrisMachineManager alloc]initWithTetrisMachine:tm
                                                                             leftCommand:left
                                                                            rightCommand:right
                                                                        transformCommand:transform];
    // 向左命令
    [tmManager toLeftCommand];
    // 向右命令
    [tmManager toRightCommand];
    // 变形命令
    [tmManager toTransformCommand];
    
    // 撤销操作
    [tmManager undoOpreation];
    // 撤销所有操作
    [tmManager undoAllOpreation];
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
