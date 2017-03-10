//
//  Globle.h
//  JavaScriptCoreTest
//
//  Created by vip on 17/3/10.
//  Copyright © 2017年 jaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol GloblePrptocol <JSExport>
-(void)changeBackgroundColor:(JSValue *)value;
@end
@interface Globle : NSObject<GloblePrptocol>
@property(nonatomic,weak)UIViewController * ownerController;
@end
