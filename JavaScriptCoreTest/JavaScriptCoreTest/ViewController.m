//
//  ViewController.m
//  JavaScriptCoreTest
//
//  Created by vip on 17/3/6.
//  Copyright © 2017年 jaki. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "Globle.h"
@interface ViewController ()

@property(nonatomic,strong)JSContext * jsContext;
@property(nonatomic,strong)NSMutableArray * actionArray;
@property(nonatomic,strong)Globle * globle;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.jsContext = [JSContext new];
    self.globle =  [Globle new];
    self.globle.ownerController = self;
    self.jsContext[@"Globle"] = self.globle;
    self.actionArray = [NSMutableArray array];
    [self render];
}

-(void)render{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"main" ofType:@"js"];
    NSData * jsData = [[NSData alloc]initWithContentsOfFile:path];
    NSString * jsCode = [[NSString alloc]initWithData:jsData encoding:NSUTF8StringEncoding];
    JSValue * jsVlaue = [self.jsContext evaluateScript:jsCode];
    for (int i=0; i<jsVlaue.toArray.count; i++) {
        JSValue * subValue = [jsVlaue objectAtIndexedSubscript:i];
        if ([[subValue objectForKeyedSubscript:@"typeName"].toString isEqualToString:@"Label"]) {
            UILabel * label = [UILabel new];
            label.frame = CGRectMake(subValue[@"rect"][@"x"].toDouble, subValue[@"rect"][@"y"].toDouble, subValue[@"rect"][@"width"].toDouble, subValue[@"rect"][@"height"].toDouble);
            label.text = subValue[@"text"].toString;
            label.textColor = [UIColor colorWithRed:subValue[@"color"][@"r"].toDouble green:subValue[@"color"][@"g"].toDouble blue:subValue[@"color"][@"b"].toDouble alpha:subValue[@"color"][@"a"].toDouble];
            [self.view addSubview:label];
        }else if ([[subValue objectForKeyedSubscript:@"typeName"].toString isEqualToString:@"Button"]){
            UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = CGRectMake(subValue[@"rect"][@"x"].toDouble, subValue[@"rect"][@"y"].toDouble, subValue[@"rect"][@"width"].toDouble, subValue[@"rect"][@"height"].toDouble);
            [button setTitle:subValue[@"text"].toString forState:UIControlStateNormal];
            button.tag = self.actionArray.count;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.actionArray addObject:subValue[@"callFunc"]];
            [self.view addSubview:button];
            
        }
    }
}

-(void)buttonAction:(UIButton *)btn{
    JSValue * action  = self.actionArray[btn.tag];
    [action callWithArguments:nil];
}



@end
