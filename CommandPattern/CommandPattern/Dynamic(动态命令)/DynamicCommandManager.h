//
//  DynamicCommandManager.h
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/18.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TetrisMachine.h"

NS_ASSUME_NONNULL_BEGIN

// 请求者:动态命令管理器
@interface DynamicCommandManager : NSObject

-(instancetype)initWithTetrisMachine:(TetrisMachine *)tm;

// 向左命令
-(void)toLeftCommand;
// 向右命令
-(void)toRightCommand;
// 变形命令
-(void)toTransformCommand;

// 撤销操作
-(void)undoOpreation;
// 撤销所有操作
-(void)undoAllOpreation;

@end

NS_ASSUME_NONNULL_END
