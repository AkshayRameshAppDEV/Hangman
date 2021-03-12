//
//  GameViewController.m
//  Hangman
//
//  Created by Akshay Ramesh on 3/10/21.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self disableSideMenuGesture];
    self.view.backgroundColor = UIColor.redColor;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"Back button called!");
}

- (void)disableSideMenuGesture {
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

@end
