//
//  ViewController.m
//  CounterApp
//
//  Created by Takayasu Sakai on 2015/11/26.
//  Copyright © 2015年 Takayasu Sakai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    int kazu;
    NSString *kazutext;
    IBOutlet UILabel *kazulabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    kazu = 0;
}

- (IBAction)plusup:(id)sender {
    kazu++;
    kazutext = [NSString stringWithFormat:@"%d", kazu];
    [kazulabel setText:kazutext];
}

- (IBAction)mainusdown :(id)sender {
    if( kazu > 0){
        kazu--;
    }
    kazutext = [NSString stringWithFormat:@"%d", kazu];
    [kazulabel setText:kazutext];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
