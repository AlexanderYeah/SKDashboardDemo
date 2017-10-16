//
//  ViewController.m
//  testLineProgressView
//
//  Created by AY .. on 14-12-4.
//  Copyright (c) 2014年 ... All rights reserved.
//

#import "ViewController.h"
#import "OutsideCircleView.h"
#import "SliderView.h"
@interface ViewController ()
@property (nonatomic,strong)LineProgressView *lineProgressView2;

@property (nonatomic,strong)OutsideCircleView *circleView;

@property (nonatomic,strong)SliderView *sliderView;

// 游标
@property (nonatomic,strong)UIImageView *markImgView;
// 拖动view
@property (nonatomic,strong)UIView *panView;
// 标记用户滑动的位置
@property (nonatomic,assign)CGFloat markValue;
// 展示Lbl
@property (nonatomic,strong)UILabel *showLbl;


@end

@implementation ViewController

static CGFloat idex = 0;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

	
	

	
	// 外边的圆环
	OutsideCircleView *view = [[OutsideCircleView alloc]init];
	_circleView = view;
	view.backgroundColor = [UIColor whiteColor];
	view.frame =CGRectMake((kWindowWidth-290.0)/2.0 , 40, 290, 290);
	[self.view addSubview:view];
	
	[self addLineProgressView];
	
	// 添加 UISlider
	[self createSlider];
	
	// 显示百分比 Lbl
	
	[self createShowLbl];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)addLineProgressView {
    LineProgressView *lineProgressView = [[LineProgressView alloc] initWithFrame:CGRectMake((kWindowWidth-235.0)/2.0 , 65, 235.0, 235.0)];
	lineProgressView.layer.borderColor = [UIColor whiteColor].CGColor;
	lineProgressView.layer.cornerRadius = 117.5;
	lineProgressView.layer.borderWidth = 1;
	_lineProgressView2 = lineProgressView;
    lineProgressView.backgroundColor = [UIColor whiteColor];
    lineProgressView.delegate = self;
    lineProgressView.total = 45;
    lineProgressView.color = [UIColor colorWithRed:250/255.0f green:238/255.0f blue:218/255.0f alpha:1];
    lineProgressView.radius = 105;
    lineProgressView.innerRadius = 93;
    lineProgressView.startAngle = M_PI * 0.72;
    lineProgressView.endAngle = M_PI * 2.28;
    lineProgressView.animationDuration = 1.0;
    lineProgressView.layer.shouldRasterize = YES;
    [self.view addSubview:lineProgressView];
    
    [lineProgressView setCompleted:0*lineProgressView.total animated:YES];
}

- (void)createSlider
{
	
	
	_sliderView = [[SliderView alloc]initWithFrame:CGRectMake(30, 500, 330, 35)];
	_sliderView.backgroundColor = [UIColor whiteColor];
	_sliderView.total = 40;
	_sliderView.process = 0;
	[self.view addSubview:_sliderView];
	
	// 写一个 游标
	
	UIView *panView = [[UIView alloc]initWithFrame:CGRectMake(30, 500, 40, 40)];
	_panView = panView;
	panView.backgroundColor = [UIColor clearColor];
	[self.view addSubview:panView];
	
	
	
	_markImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 2.3, 42)];
	_markImgView.image = [UIImage imageNamed:@"扩香挡位-长条@3x"];
	[panView addSubview:_markImgView];
	
	
	UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGRAct:)];
    [panView setUserInteractionEnabled:YES];
    [panView addGestureRecognizer:panGR];

}
- (void)createShowLbl
{
	_showLbl = [[UILabel alloc]init];
	_showLbl.frame = CGRectMake((kWindowWidth-80)/2.0 , 140, 100, 100);
	_showLbl.textColor = [UIColor blackColor];
	_showLbl.text = @"80%";
	_showLbl.font = [UIFont boldSystemFontOfSize:45.0f];
	[self.view addSubview:_showLbl];

}

- (void)panGRAct: (UIPanGestureRecognizer *)rec{
          
	
	CGPoint point = [rec translationInView:self.view];
//	NSLog(@"%f,%f",point.x,point.y);
	
	CGFloat px = self.panView.frame.origin.x;
	CGFloat py = self.panView.frame.origin.y;
	// 限制上下
	if (py > 500 || py < 500) {
		self.panView.frame = CGRectMake(px, 500, 40, 40);
	}
	
	// 限制左右
	if (px < 30) {
		self.panView.frame = CGRectMake(30, 500, 40, 40);
	}
	if (px > 360) {
		self.panView.frame = CGRectMake(360, 500, 40, 40);
	}
	
	
	// 获取用户滑动的位置 计算出markValue
	CGFloat compareX = px - 30;
	_markValue =  (int)compareX / 10;
	
	self.sliderView.process =_markValue ;
	
	[self.sliderView setNeedsDisplay];
	
//	if (_markValue == 1) {
//		self.panView.frame = CGRectMake(30 + _markValue * 80, 500, 40, 40);
//	}
	CGFloat index = _markValue / 8;
	[_lineProgressView2 setCompleted:index / 5 *_lineProgressView2.total animated:YES];
	
	// 游标要回到对应的位置
	_showLbl.text = [NSString stringWithFormat:@"%d%%",(int)index * 20];
	
	
	rec.view.center = CGPointMake(rec.view.center.x + point.x, rec.view.center.y + point.y);
	[rec setTranslation:CGPointMake(0, 0) inView:self.view];
	
	
}



- (void)sliderValueChanged:(UISlider*)slider
{
	
	
}
- (void)sliderDragUp:(UISlider *)slider
{

	
}

@end




