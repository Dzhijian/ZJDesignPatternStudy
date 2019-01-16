//
//  TetrisMachineManager.h
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/14.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMToLeftCommand.h"
#import "TMToRightCommand.h"
#import "TMToTransformCommand.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * 角色四：请求者 ->命令管理器 TetrisMachineManager
 */
@interface TetrisMachineManager : NSObject

-(instancetype)initWithTetrisMachine:(TetrisMachine *)tm
                         leftCommand:(TMToLeftCommand *)leftCommand
                        rightCommand:(TMToRightCommand *)rightCommand
                    transformCommand:(TMToTransformCommand *)transformCommand;
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
