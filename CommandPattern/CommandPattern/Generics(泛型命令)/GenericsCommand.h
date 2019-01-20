//
//  GenericsCommand.h
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/21.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMCommandProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface GenericsCommand<T> : NSObject<TMCommandProtocol>

-(instancetype)initWithReceiver:(T)receiver block:(void(^)(T))commandBlock;
//提供一个创建命令类方法
+(id<TMCommandProtocol>)createCommand:(T)receiver block:(void(^)(T))commandBlock;

@end

NS_ASSUME_NONNULL_END
