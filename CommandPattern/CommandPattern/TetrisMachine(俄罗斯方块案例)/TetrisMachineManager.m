//
//  TetrisMachineManager.m
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/14.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import "TetrisMachineManager.h"
@interface TetrisMachineManager ()
@property (nonatomic, strong) TMToLeftCommand *leftCommand;
@property (nonatomic, strong) TMToRightCommand *rightCommand;
@property (nonatomic, strong) TMToTransformCommand *transformCommand;
@end
@implementation TetrisMachineManager

-(instancetype)initWithToLeftCommand:(TMToLeftCommand *)leftCommand rightCommand:(TMToRightCommand *)rightCommand transformCommand:(TMToTransformCommand *)transformCommand{
    if (self = [super init]) {
        self.leftCommand = leftCommand;
        self.rightCommand = rightCommand;
        self.transformCommand = transformCommand;
    }
    return self;
}

// 调用命令
-(void)toLeftCommand{
    [self.leftCommand execute];
}

-(void)toRightCommand{
    [self.rightCommand execute];
}

-(void)toTransformCommand{
    [self.transformCommand execute];
}
@end
