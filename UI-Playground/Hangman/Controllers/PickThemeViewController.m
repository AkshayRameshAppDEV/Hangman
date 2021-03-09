//
//  ViewController.m
//  Hangman
//
//  Created by Akshay Ramesh on 3/6/21.
//

#import "PickThemeViewController.h"

@interface PickThemeViewController ()

@end

@implementation PickThemeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //View 1
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor blueColor];
    [view1.heightAnchor constraintEqualToConstant:100].active = true;
    [view1.widthAnchor constraintEqualToConstant:100].active = true;


    //View 2
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    [view2.heightAnchor constraintEqualToConstant:100].active = true;
    [view2.widthAnchor constraintEqualToConstant:100].active = true;

    //View 3
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor magentaColor];
    [view3.heightAnchor constraintEqualToConstant:100].active = true;
    [view3.widthAnchor constraintEqualToConstant:100].active = true;
    
    //View 3
    UIView *view4 = [[UIView alloc] init];
    view4.backgroundColor = [UIColor magentaColor];
    [view4.heightAnchor constraintEqualToConstant:100].active = true;
    [view4.widthAnchor constraintEqualToConstant:100].active = true;
    
    //View 3
    UIView *view5 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor magentaColor];
    [view3.heightAnchor constraintEqualToConstant:100].active = true;
    [view3.widthAnchor constraintEqualToConstant:100].active = true;
    
    //View 3
    UIView *view6 = [[UIView alloc] init];
    view4.backgroundColor = [UIColor magentaColor];
    [view4.heightAnchor constraintEqualToConstant:100].active = true;
    [view4.widthAnchor constraintEqualToConstant:100].active = true;

    
    
    //Stack View
    UIStackView *horizontalStackView1 = [[UIStackView alloc] init];
    horizontalStackView1.axis = UILayoutConstraintAxisHorizontal;
    horizontalStackView1.distribution = UIStackViewDistributionEqualSpacing;
    horizontalStackView1.alignment = UIStackViewAlignmentCenter;
    horizontalStackView1.spacing = 20;
    [horizontalStackView1 addArrangedSubview:view1];
    [horizontalStackView1 addArrangedSubview:view2];
    horizontalStackView1.translatesAutoresizingMaskIntoConstraints = false;
    
    UIStackView *horizontalStackView2 = [[UIStackView alloc] init];
    horizontalStackView2.axis = UILayoutConstraintAxisHorizontal;
    horizontalStackView2.distribution = UIStackViewDistributionEqualSpacing;
    horizontalStackView2.alignment = UIStackViewAlignmentCenter;
    horizontalStackView2.spacing = 20;
    [horizontalStackView2 addArrangedSubview:view3];
    [horizontalStackView2 addArrangedSubview:view4];
    horizontalStackView2.translatesAutoresizingMaskIntoConstraints = false;
    
    UIStackView *horizontalStackView3 = [[UIStackView alloc] init];
    horizontalStackView3.axis = UILayoutConstraintAxisHorizontal;
    horizontalStackView3.distribution = UIStackViewDistributionEqualSpacing;
    horizontalStackView3.alignment = UIStackViewAlignmentCenter;
    horizontalStackView3.spacing = 20;
    [horizontalStackView3 addArrangedSubview:view5];
    [horizontalStackView3 addArrangedSubview:view6];
    horizontalStackView3.translatesAutoresizingMaskIntoConstraints = false;
    
    ////////////////////////    ////////////////////////
    ////////////////////////
    ////////////////////////

    
    //Stack View
    UIStackView *mainstackView = [[UIStackView alloc] init];
    mainstackView.axis = UILayoutConstraintAxisVertical;
    mainstackView.distribution = UIStackViewDistributionEqualSpacing;
    mainstackView.alignment = UIStackViewAlignmentCenter;
    mainstackView.spacing = 10;
    [mainstackView addArrangedSubview:horizontalStackView1];
    [mainstackView addArrangedSubview:horizontalStackView2];
    [mainstackView addArrangedSubview:horizontalStackView3];
    

    
    
    

    mainstackView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:mainstackView];


    //Layout for Stack View
    [mainstackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [mainstackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = true;
    
}


@end
