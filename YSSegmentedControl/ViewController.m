//
//  ViewController.m
//  YSSegmentedControl
//
//  Created by yanghandsome on 16/4/13.
//  Copyright © 2016年 yanghandsome. All rights reserved.
//

#define self_Width CGRectGetWidth([UIScreen mainScreen].bounds)
#define self_Height CGRectGetHeight([UIScreen mainScreen].bounds)

#import "ViewController.h"
#import "YSSegmentedControl.h"

@interface ViewController ()<YSSegmentedControlDelegate,UIScrollViewDelegate>

@property (nonatomic ,weak)YSSegmentedControl * YSSegmente;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createYSSegmentedControl];
    
}

- (void)createYSSegmentedControl {
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self_Width,self_Height)];
    view1.backgroundColor = [UIColor blackColor];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self_Width,self_Height)];
    view2.backgroundColor = [UIColor yellowColor];
    
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self_Width,self_Height)];
    view3.backgroundColor = [UIColor redColor];
    
    UIView *view4 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self_Width,self_Height)];
    view4.backgroundColor = [UIColor blueColor];
    
    NSArray *view = @[view1,view2,view3,view4];
    NSArray* LFLarray=[NSArray arrayWithObjects:@"演示标题1",@"演示标题2",@"演示标题3",@"演示标题3",nil];
    
    YSSegmentedControl* YSSegmente = [[YSSegmentedControl alloc]initWithFrame:CGRectMake(0, 64, self_Width, self_Height)];
    
    YSSegmente.delegate = self;
    [YSSegmente AddSegumentArray:LFLarray];
    [YSSegmente AddSegumentViewArray:view];
    //   2.设置显示切换标题数组
    [YSSegmente selectTheSegument:2];
    [self.view addSubview:YSSegmente];
    
    self.YSSegmente = YSSegmente;
    
}

#pragma mark ---YSSegmentedControlDelegate
/**
 *  点击标题按钮
 *
 *  @param selection 对应下标 begain 0
 */
-(void)uisegumentSelectionChange:(NSInteger)selection{
    
    //    NSLog(@"%ld",selection);
}


@end
