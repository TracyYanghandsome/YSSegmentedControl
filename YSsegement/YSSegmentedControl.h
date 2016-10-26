//
//  YSSegmentedControl.h
//  YSSegmentedControl
//
//  Created by yanghandsome on 16/4/13.
//  Copyright © 2016年 yanghandsome. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YSSegmentedControlDelegate< NSObject>

@optional
/**
 外界调用获取点击下标
 */
- (void)uisegumentSelectionChange:(long)selection;

@end

@interface YSSegmentedControl : UIView{
    
    NSArray *_titleArray;           /**< 菜单标题 */
    NSArray *_views;
}

@property(nonatomic,strong) id <YSSegmentedControlDelegate>delegate;
@property(nonatomic,strong) NSMutableArray *ButtonArray;/**< 对应的标题文字 */
@property(strong,nonatomic) UIColor *LFLBackGroundColor;/**< BackGround颜色 */
@property(strong,nonatomic) UIColor *titleColor;/**< 标题文字颜色 */
@property(strong,nonatomic) UIColor *selectColor;/**< 选中按钮的颜色 */
@property(strong,nonatomic) UIFont *titleFont;/**< 字体大小 */

@property(nonatomic, strong)UIScrollView *mainScrollView;

- (void)AddSegumentArray:(NSArray *)SegumentArray;
- (void)AddSegumentViewArray:(NSArray *)SegumentArray;
- (instancetype)initWithFrame:(CGRect)frame;
- (void)selectTheSegument:(NSInteger)segument;
- (id)initWithFrame:(CGRect)frame
             titles:(NSArray<NSString *> *)titles
              views:(NSArray<__kindof UIView *> *)views;

@end
