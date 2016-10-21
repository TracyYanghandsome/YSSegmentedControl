# YSSegmentedControl
###类似于新闻的滑动视图

#####根据自己项目需求简单的封装了下，有问题可以加我QQ交流，Q2224202043. 效果如下:

 ![image](https://github.com/TracyYanghandsome/YSSegmentedControl/raw/master//demo.gif)
 
 ```objective-c
	NSArray *view = @[view1,view2,view3,view4];
    NSArray* LFLarray=[NSArray arrayWithObjects:@"演示标题1",@"演示标题2",@"演示标题3",@"演示标题3",nil];
    YSSegmentedControl* YSSegmente = [[YSSegmentedControl alloc]initWithFrame:CGRectMake(0, 64, self_Width, self_Height)];
    
    YSSegmente.delegate = self;
    [YSSegmente AddSegumentArray:LFLarray];
    [YSSegmente AddSegumentViewArray:view];
    //设置显示切换标题数组
    [YSSegmente selectTheSegument:2];
    [self.view addSubview:YSSegmente];
```