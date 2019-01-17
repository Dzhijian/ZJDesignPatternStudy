//
//  DynamicCommand.h
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/17.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TetrisMachineManager.h"
#import "TetrisMachine.h"
NS_ASSUME_NONNULL_BEGIN

/**
 * 特点一: 实现命令协议
 * 特点二: 传递接收者
 */

typedef void(^DynamicBlock)(TetrisMachine *tm);

@interface DynamicCommand : NSObject<TMCommandProtocol>

-(instancetype)initTetrisMachine:(TetrisMachine *)tm block:(DynamicBlock)tmBlock;

+(id<TMCommandProtocol>)createCommand:(TetrisMachine *)tm block:(DynamicBlock)tmBlock;
@end

NS_ASSUME_NONNULL_END
