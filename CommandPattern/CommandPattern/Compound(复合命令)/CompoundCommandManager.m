//
//  CompoundCommandManager.m
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/22.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import "CompoundCommandManager.h"
#import "DynamicCommand.h"
#import "CompoundCommand.h"
@interface CompoundCommandManager ()
@property(nonatomic, strong) NSMutableArray* commands;
@property(nonatomic, strong) TetrisMachine* tm;
@end

@implementation CompoundCommandManager

- (instancetype)initWithTetrisMachine:(TetrisMachine*)tm{
    self = [super init];
    if (self) {
        self.tm = tm;
        self.commands = [[NSMutableArray alloc] init];
    }
    return self;
}

// 向左命令
-(void)toLeftCommand{
    [self addCommand:@"toLeft"];
    [self.tm toLeft];
}
// 向右命令
-(void)toRightCommand{
    [self addCommand:@"toRight"];
    [self.tm toRight];
}
// 变形命令
-(void)toTransformCommand{
    [self addCommand:@"toTransform"];
    [self.tm toTransform];
}

-(void)addCommand:(NSString*)methodName{
    //根据方法名称，动态加载执行对象的方法(runtime基础知识)
    //自己复习一下关于runtime基础知识
    //获取到方法对象
    SEL method = NSSelectorFromString(methodName);
    //添加动态命令
    [self.commands addObject:[DynamicCommand createCommand:self.tm block:^(TetrisMachine *tm) {
        //执行回调
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [tm performSelector:method];
#pragma clang diagnostic pop
    }]];
}

-(void)undoOpreation{
    //倒序(队列->自己设计)
    if (self.commands.count > 0) {
        NSLog(@"撤销如下：...");
        //撤销->DynamicCommand
        [[self.commands lastObject] execute];
        //移除
        [self.commands removeLastObject];
    }
}

-(void)undoAllOpreation{
    NSLog(@"撤销所有");
    //倒数删除->课后去实现（循环倒数删除）
    //协议规范写法->语法规范
    //复合命令调用
    CompoundCommand* command = [[CompoundCommand alloc] initWithCommands:self.commands];
    [command execute];
    [self.commands removeAllObjects];
}
@end
