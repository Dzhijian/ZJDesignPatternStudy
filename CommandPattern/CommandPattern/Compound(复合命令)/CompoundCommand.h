//
//  CompoundCommand.h
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/22.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMCommandProtocol.h"
NS_ASSUME_NONNULL_BEGIN
//复合命令：执行多个命令
@interface CompoundCommand : NSObject<TMCommandProtocol>

-(instancetype)initWithCommands:(NSMutableArray *)commands;
@end

NS_ASSUME_NONNULL_END
