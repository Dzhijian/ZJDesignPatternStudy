//
//  TMCommandProtocol.h
//  CommandPattern
//
//  Created by 邓志坚 on 2019/1/14.
//  Copyright © 2019 邓志坚. All rights reserved.
//

#ifndef TMCommandProtocol_h
#define TMCommandProtocol_h

/**
 * 命令接口 -> CommandProtocol(协议)
 */
@protocol TMCommandProtocol<NSObject>

/**
 * 具体命令
 */
-(void)execute;

@end
#endif /* TMCommandProtocol_h */
