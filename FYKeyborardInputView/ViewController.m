//
//  ViewController.m
//  FYKeyborardInputView
//
//  Created by mac on 2018/4/8.
//  Copyright © 2018年 fanyang. All rights reserved.
//

#import "ViewController.h"
#import "FYKeyborardInputView.h"
#import "FYKeyborardEditView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet FYKeyborardEditView *editView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.editView.infoBlock = ^(NSString *info) {
        NSLog(@"edit result:%@", info);
    };
}

- (IBAction)showInputView:(id)sender {
    [FYKeyborardInputView showWithBlock:^(NSString *info) {
        NSLog(@"result:%@", info);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
