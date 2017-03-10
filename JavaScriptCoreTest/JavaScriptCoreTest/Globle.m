//
//  Globle.m
//  JavaScriptCoreTest
//
//  Created by vip on 17/3/10.
//  Copyright © 2017年 jaki. All rights reserved.
//

#import "Globle.h"

@implementation Globle
-(void)changeBackgroundColor:(JSValue *)value{
    self.ownerController.view.backgroundColor = [UIColor colorWithRed:value[@"r"].toDouble green:value[@"g"].toDouble blue:value[@"b"].toDouble alpha:value[@"a"].toDouble];
}
@end
