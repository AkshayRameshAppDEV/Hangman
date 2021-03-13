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
    [self setupNavbar];
    [self setupLabels];
    [self setupStackViews];
}

- (void)setupLabels {
    self.view.backgroundColor = UIColor.whiteColor;
    
    // Hangman Label
    self.hangmanLabel = [[UILabel alloc] init];
    self.hangmanLabel.text = NSLocalizedString(@"game_view_hangman_label", nil);
    self.hangmanLabel.textAlignment = NSTextAlignmentCenter;
    self.hangmanLabel.numberOfLines = 0;
    self.hangmanLabel.font = [UIFont systemFontOfSize:30.0];
    self.hangmanLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    // Clues Label
    self.clueLabel = [[UILabel alloc] init];
    self.clueLabel.text = NSLocalizedString(@"game_view_clue_label", nil);
    self.clueLabel.textAlignment = NSTextAlignmentCenter;
    self.clueLabel.numberOfLines = 0;
    self.clueLabel.font = [UIFont systemFontOfSize:30.0];
    self.clueLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    // Blanks Label
    self.blanksLabel = [[UILabel alloc] init];
    self.blanksLabel.text = NSLocalizedString(@"game_view_blanks_label", nil);
    self.blanksLabel.textAlignment = NSTextAlignmentCenter;
    self.blanksLabel.numberOfLines = 0;
    self.blanksLabel.font = [UIFont systemFontOfSize:25.0];
    self.blanksLabel.translatesAutoresizingMaskIntoConstraints = false;
}

- (void)setupStackViews {
    
    // Main Stack View
    UIStackView *mainstackView = [[UIStackView alloc] init];
    mainstackView.axis = UILayoutConstraintAxisVertical;
    mainstackView.alignment = UIStackViewAlignmentFill;
    mainstackView.distribution = UIStackViewDistributionFillEqually;
    mainstackView.spacing = 0;
    mainstackView.translatesAutoresizingMaskIntoConstraints = false;
    [mainstackView addArrangedSubview:self.hangmanLabel];
    [mainstackView addArrangedSubview:self.clueLabel];
    [mainstackView addArrangedSubview:self.blanksLabel];
    
    //Constraining Main Stack View to superview
    [self.view addSubview:mainstackView];
    [mainstackView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor].active = true;
    [mainstackView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor].active = true;
    [mainstackView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = true;
    [mainstackView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = true;
    
}

- (void)setupNavbar {
    self.navigationItem.hidesBackButton = YES;
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"game_view_nav_left_bar_button_item_title", nil) style:UIBarButtonItemStylePlain target:self action:@selector(exitGame:)];
    self.navigationItem.leftBarButtonItem = newBackButton;
}

- (void) exitGame:(UIBarButtonItem *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"game_view_exit_alert_title", nil) message:NSLocalizedString(@"game_view_exit_alert_message", nil) preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"game_view_exit_alert_yes", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"game_view_exit_alert_no", nil) style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:noAction];
    [alert addAction:yesAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
