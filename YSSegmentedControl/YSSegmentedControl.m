//
//  YSSegmentedControl.m
//  YSSegmentedControl
//
//  Created by yanghandsome on 16/4/13.
//  Copyright © 2016年 yanghandsome. All rights reserved.
//

#import "YSSegmentedControl.h"
#define self_Width CGRectGetWidth([UIScreen mainScreen].bounds)
#define self_Height CGRectGetHeight([UIScreen mainScreen].bounds)

@interface YSSegmentedControl()<YSSegmentedControlDelegate,UIScrollViewDelegate>

@end

@implementation YSSegmentedControl {
    CGFloat widthFloat;
    UIView* buttonDown;
    NSInteger selectSeugment;
}

- (id)initWithFrame:(CGRect)frame
             titles:(NSArray<NSString *> *)titles
              views:(NSArray<__kindof UIView *> *)views {
    self = [super initWithFrame:frame];
    if (self) {
        _views = views;
        _titleArray = titles;
        selectSeugment=0;
        self.userInteractionEnabled = YES;
        self.ButtonArray=[NSMutableArray arrayWithCapacity:_ButtonArray.count];
        self.titleFont=[UIFont systemFontOfSize:14.0];
        self.LFLBackGroundColor = [UIColor whiteColor];
        self.titleColor = [UIColor blackColor];
        self.selectColor=[UIColor blackColor];
        //    整体背景颜色
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
/**
 34 ---默认高度,可以根据项目需求自己更改
 */
- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self)
    {
        selectSeugment=0;
        self.ButtonArray=[NSMutableArray arrayWithCapacity:_ButtonArray.count];
        self.titleFont=[UIFont systemFontOfSize:14.0];
        self.LFLBackGroundColor = [UIColor whiteColor];
        self.titleColor = [UIColor blackColor];
        self.selectColor=[UIColor blackColor];
        //    整体背景颜色
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)AddSegumentArray:(NSArray *)SegumentArray{
    
    NSInteger seugemtNumber=SegumentArray.count;
    widthFloat = (self.bounds.size.width)/seugemtNumber;
    for (int i=0; i < SegumentArray.count; i++) {
        UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(i*widthFloat, 0, widthFloat, 34-2)];
        [button setTitle:SegumentArray[i] forState:UIControlStateNormal];
        [button.titleLabel setFont:self.titleFont];
        [button setTitleColor:self.titleColor forState:UIControlStateNormal];
        [button setTitleColor:self.selectColor forState:UIControlStateSelected];
        [button setTag:i];
        [button addTarget:self action:@selector(changeTheSegument:) forControlEvents:UIControlEventTouchUpInside];
        if (i==0) {
            //默认下划线高  2
            buttonDown=[[UIView alloc]initWithFrame:CGRectMake(i*widthFloat, 34-2, widthFloat, 2)];
            
#pragma mark -----buttonDown 设置下划线颜色
            [buttonDown setBackgroundColor:[UIColor yellowColor]];
            [self addSubview:buttonDown];
        }
        [self addSubview:button];
        [self.ButtonArray addObject:button];
    }
    [[self.ButtonArray firstObject] setSelected:YES];
}

- (void)AddSegumentViewArray:(NSArray *)SegumentArray {
    
    CGFloat begainScrollViewY = 37;
    self.mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, begainScrollViewY, self_Width,(self_Height -begainScrollViewY))];
    [self addSubview:self.mainScrollView];
    self.mainScrollView.bounces = NO;
    self.mainScrollView.pagingEnabled = YES;
    self.mainScrollView.contentSize = CGSizeMake(self_Width * SegumentArray.count, (self_Height -begainScrollViewY));
    //设置代理
    self.mainScrollView.delegate = self;
    
    for (int i=0; i < SegumentArray.count; i++) {
        
        UIView * view = [SegumentArray objectAtIndex:i];
        view.frame = CGRectMake(self_Width*i, 0, self.bounds.size.width,self.bounds.size.height);
        
        [self.mainScrollView addSubview:view];
    }
    
}


#pragma mark --- UIScrollView代理方法

static NSInteger pageNumber = 0;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    pageNumber = (int)(scrollView.contentOffset.x / self_Width + 0.5);
    [self selectTheSegument:pageNumber];
}

- (void)changeTheSegument:(UIButton*)button{
    [self selectTheSegument:button.tag];
}
- (void)selectTheSegument:(NSInteger)segument{
    
    if (selectSeugment!=segument) {
        [self.ButtonArray[selectSeugment] setSelected:NO];
        [self.ButtonArray[segument] setSelected:YES];
        [UIView animateWithDuration:0.1 animations:^{
            [buttonDown setFrame:CGRectMake(segument*widthFloat,34-2, widthFloat, 2)];
        }];
        [UIView animateWithDuration:0.1 animations:^{
            [self.mainScrollView setContentOffset:CGPointMake(self.frame.size.width *segument, 0)];
        }];
        selectSeugment=segument;
        [self.delegate uisegumentSelectionChange:selectSeugment];
    }
}

@end
