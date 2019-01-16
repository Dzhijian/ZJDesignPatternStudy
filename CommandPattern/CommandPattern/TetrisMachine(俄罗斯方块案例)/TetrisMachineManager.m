//
//  TetrisMachineManager.m
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/14.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import "TetrisMachineManager.h"
@interface TetrisMachineManager ()
@property (nonatomic, strong) TetrisMachine *tm;
@property (nonatomic, strong) TMToLeftCommand *leftCommand;
@property (nonatomic, strong) TMToRightCommand *rightCommand;
@property (nonatomic, strong) TMToTransformCommand *transformCommand;

// 保存所有操作
@property (nonatomic, strong) NSMutableArray *commands;

@end

@implementation TetrisMachineManager

-(instancetype)initWithTetrisMachine:(TetrisMachine *)tm leftCommand:(TMToLeftCommand *)leftCommand rightCommand:(TMToRightCommand *)rightCommand transformCommand:(TMToTransformCommand *)transformCommand{
    
    if (self = [super init]) {
        self.tm = tm;
        self.leftCommand = leftCommand;
        self.rightCommand = rightCommand;
        self.transformCommand = transformCommand;
    }
    return self;
}

// 调用命令
-(void)toLeftCommand {
    [self.leftCommand execute];
    // 保存向左命令操作到数组中
    [self.commands addObject:[[TMToLeftCommand alloc] initWithTetrisMachine:self.tm]];
}

-(void)toRightCommand {
    [self.rightCommand execute];
    // 保存向右命令操作到数组中
    [self.commands addObject:[[TMToRightCommand alloc] initWithTetrisMachine:self.tm]];
}

-(void)toTransformCommand {
    [self.transformCommand execute];
    // 保存变形命令操作到数组中
    [self.commands addObject:[[TMToTransformCommand alloc] initWithTetrisMachine:self.tm]];
}

// 撤销操作
-(void)undoOpreation{
    NSLog(@"撤销操作");
    if (self.commands.count > 0 ) {
        // 撤销操作
        [[self.commands lastObject] execute];
        // 移除保存在数组中的最后一个操作
        [self.commands removeLastObject];
    }
}

// 撤销所有操作
-(void)undoAllOpreation{
    NSLog(@"撤销所有操作");
    for (id<TMCommandProtocol> command in self.commands) {
        [command execute];
    }
    // 移除所有操作
    [self.commands removeAllObjects];
}

-(NSMutableArray *)commands{
    if (!_commands) {
        _commands = [NSMutableArray array];
    }
    return _commands;
}
@end
