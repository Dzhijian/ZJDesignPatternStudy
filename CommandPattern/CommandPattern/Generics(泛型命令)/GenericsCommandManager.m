//
//  GenericsCommandManager.m
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/21.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import "GenericsCommandManager.h"
#import "GenericsCommand.h"

@interface GenericsCommandManager ()
@property (nonatomic, strong) TetrisMachine *tm;
// 保存所有命令操作
@property (nonatomic, strong) NSMutableArray *commands;
@end
@implementation GenericsCommandManager


-(instancetype)initWithTetrisMachine:(TetrisMachine *)tm{
    if (self = [super init]) {
        self.tm = tm;
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


-(void)addCommand:(NSString *)methodName{
    // 根据方法名称,动态加载执行对象的方法
    // 获取方法对象
    SEL method = NSSelectorFromString(methodName);
    
    // 添加命令
    [self.commands addObject:[GenericsCommand createCommand:self.tm block:^(TetrisMachine * _Nonnull tm) {
        [self.tm performSelector:method];
    }]];
    
}

// 撤销操作
-(void)undoOpreation{
    if (self.commands.count > 0 ) {
        NSLog(@"撤销最后一个命令...");
        // 撤销操作
        [[self.commands lastObject] execute];
        // 移除保存在数组中的最后一个操作
        [self.commands removeLastObject];
    }
}
// 撤销所有操作
-(void)undoAllOpreation{
    
    NSLog(@"撤销所有命令...");
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
