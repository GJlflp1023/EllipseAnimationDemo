//
//  ViewController.m
//  EllipseAnimationDemo
//
//  Created by v_guijiang on 2024/1/2.
//

#import "ViewController.h"
#import "GJEllipseView.h"
#define KColorFromRGBAlpha(rgbValue,a)  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

@interface ViewController ()
@property (strong,nonatomic) GJEllipseView *ellipseView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _ellipseView = [[GJEllipseView alloc] initWithFrame:CGRectMake(100, 200, 100, 200)];

//    _ellipseView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_ellipseView];
    
    NSMutableArray *colors1 =  [NSMutableArray array];
   
//    [colors1 addObject:(id)KColorFromRGBAlpha(0xFFD000,0.5).CGColor];
    [colors1 addObject:(id)KColorFromRGBAlpha(0x21EA59,0.8).CGColor];
    [colors1 addObject:(id)KColorFromRGBAlpha(0x2468F2,0.8).CGColor];
    [colors1 addObject:(id)KColorFromRGBAlpha(0x2468F2,1.0).CGColor];

    NSMutableArray *colors =  [NSMutableArray array];
    [colors addObject:(id)KColorFromRGBAlpha(0xF2D224,0.04).CGColor];
    [colors addObject:(id)KColorFromRGBAlpha(0xFFD000,0.5).CGColor];
    [colors addObject:(id)KColorFromRGBAlpha(0x21EA59,0.8).CGColor];
//    self.ellipseView.leftColors = self.ellipseView.leftColors.count>2 ?colors : colors1;
    self.ellipseView.leftColors = colors1;
    self.ellipseView.rightColors = colors;
}


- (IBAction)Gradient:(UIButton *)sender {
    
    NSMutableArray *colors1 =  [NSMutableArray array];
   
//    [colors1 addObject:(id)KColorFromRGBAlpha(0xFFD000,0.5).CGColor];
    [colors1 addObject:(id)KColorFromRGBAlpha(0x2468F2,0.8).CGColor];
    [colors1 addObject:(id)KColorFromRGBAlpha(0x2468F2,1.0).CGColor];

    NSMutableArray *colors =  [NSMutableArray array];
    [colors addObject:(id)KColorFromRGBAlpha(0x2468F2,0.04).CGColor];
    [colors addObject:(id)KColorFromRGBAlpha(0x2468F2,0.8).CGColor];
//    self.ellipseView.leftColors = self.ellipseView.leftColors.count>2 ?colors : colors1;
    self.ellipseView.leftColors = colors1;
    self.ellipseView.rightColors = colors;
   
}
- (IBAction)viewFrame:(UIButton *)sender {
  
   
             [UIView animateWithDuration:0.5 animations:^{
                 _ellipseView.ellipticRect= self.ellipseView.frame.size.width>100 ? CGRectMake(100, 200, 100, 200) : CGRectMake(100, 200, 150, 250);
                 self->_ellipseView.frame = self.ellipseView.frame.size.width>100 ? CGRectMake(100, 200, 100, 200) : CGRectMake(100, 200, 150, 250);
              
             } completion:^(BOOL finished) {
                 // 动画完成的设置
                
             }];
         
    
  
   
    
}
- (IBAction)frameAndGradient:(UIButton *)sender {
}

@end
