//
//  ViewController.m
//  SCScrollNumberViewDemo
//
//  Created by Aevit on 2016/12/13.
//  Copyright © 2016年 Aevit. All rights reserved.
//

#import "ViewController.h"
#import "SCScrollNumberView.h"

@interface ViewController ()

@property (nonatomic, strong) SCScrollNumberView *scrollNumberView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self scrollNumberView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (SCScrollNumberView *)scrollNumberView {
    if (!_scrollNumberView) {
        _scrollNumberView = [[SCScrollNumberView alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        [self.view addSubview:_scrollNumberView];
        _scrollNumberView.center = self.view.center;
    }
    return _scrollNumberView;
}

- (IBAction)startBtnPressed:(id)sender {
    self.scrollNumberView.number = @4782;
//    self.scrollNumberView.exceptAnimIndexSet = [NSMutableSet setWithObjects:@1, @3, nil];
    [self.scrollNumberView startAnimation];
}

@end
