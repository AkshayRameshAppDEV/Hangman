//
//  GameViewController.m
//  Hangman
//
//  Created by Akshay Ramesh on 3/10/21.
//

#import "GameViewController.h"

@interface GameViewController () {
    NSArray *alphabets;
}

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.systemBackgroundColor;
    alphabets = @[@[@"A", @"B", @"C", @"D", @"E"],
                  @[@"F", @"G", @"H", @"I", @"J"],
                  @[@"K", @"L", @"M", @"N", @"O"],
                  @[@"P", @"Q", @"R", @"S", @"T"],
                  @[@"U", @"V", @"W", @"X", @"Y"],
                  @"Z"
                 ];
    [self setupNavbar];
    [self setupLabels];
    [self setupStackViews];
}

- (void)setupLabels {
    
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
}

-(UIStackView*) setupBlankHorizontalStackView {
    // Horizontal stack view of Blanks buttons
    NSMutableArray *blankButtonArray = [[NSMutableArray alloc] init];
    for (int j = 0; j < 5; j++) {
        UIButton *blankButton = [[UIButton alloc] init];
        blankButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [blankButton setTitle: NSLocalizedString(@"_", nil) forState:UIControlStateNormal];
        blankButton.titleLabel.numberOfLines = 0;
        [blankButton.titleLabel setFont:[UIFont boldSystemFontOfSize:20.0]];
        [blankButton setUserInteractionEnabled:NO];
        [blankButton setTitleColor:UIColor.systemGrayColor forState:UIControlStateNormal];
        blankButton.translatesAutoresizingMaskIntoConstraints = false;
        [blankButtonArray addObject:blankButton];
    }
    
    UIStackView *blanksHorizontalStackView = [[UIStackView alloc] initWithArrangedSubviews:blankButtonArray];
    blanksHorizontalStackView.axis = UILayoutConstraintAxisHorizontal;
    blanksHorizontalStackView.alignment = UIStackViewAlignmentFill;
    blanksHorizontalStackView.distribution = UIStackViewDistributionFillEqually;
    blanksHorizontalStackView.spacing = 0;
    [blanksHorizontalStackView setTag:100];
    blanksHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false;
    return blanksHorizontalStackView;
}

-(UIStackView*) setupHorizontalStackViewOfAToZButtons {
    // Horizontal Stack View
    UIStackView *horizontalstackView = [[UIStackView alloc] init];
    horizontalstackView.axis = UILayoutConstraintAxisHorizontal;
    horizontalstackView.alignment = UIStackViewAlignmentFill;
    horizontalstackView.distribution = UIStackViewDistributionFillEqually;
    horizontalstackView.spacing = 0;
    horizontalstackView.translatesAutoresizingMaskIntoConstraints = false;
    for (int i = 0; i < 5; i++) {
        // Vertical Stack view of A-Y buttons
        UIStackView *buttonVerticalStackViewAToY = [[UIStackView alloc] init];
        buttonVerticalStackViewAToY.axis = UILayoutConstraintAxisVertical;
        buttonVerticalStackViewAToY.alignment = UIStackViewAlignmentFill;
        buttonVerticalStackViewAToY.distribution = UIStackViewDistributionFillEqually;
        buttonVerticalStackViewAToY.spacing = 0;
        buttonVerticalStackViewAToY.translatesAutoresizingMaskIntoConstraints = false;
        for (int j = 0; j < 5; j++) {
            UIButton *alphaButton = [[UIButton alloc] init];
            alphaButton = [UIButton buttonWithType:UIButtonTypeSystem];
            NSArray *tempAlphaArray = [alphabets objectAtIndex:i];
            [alphaButton setTitle: NSLocalizedString([tempAlphaArray objectAtIndex:j], nil) forState:UIControlStateNormal];
            alphaButton.titleLabel.numberOfLines = 0;
            [alphaButton.titleLabel setFont:[UIFont boldSystemFontOfSize:15.0]];
            [alphaButton addTarget:self action:@selector(alphabetPressed:) forControlEvents:UIControlEventTouchUpInside];
            alphaButton.translatesAutoresizingMaskIntoConstraints = false;
            [buttonVerticalStackViewAToY addArrangedSubview:alphaButton];
        }
        [horizontalstackView addArrangedSubview:buttonVerticalStackViewAToY];
    }
    
    // Vertical stack view Z button
    UIStackView *buttonVerticalStackViewZ = [[UIStackView alloc] init];
    buttonVerticalStackViewZ.axis = UILayoutConstraintAxisVertical;
    buttonVerticalStackViewZ.alignment = UIStackViewAlignmentFill;
    buttonVerticalStackViewZ.distribution = UIStackViewDistributionFillEqually;
    buttonVerticalStackViewZ.spacing = 0;
    buttonVerticalStackViewZ.translatesAutoresizingMaskIntoConstraints = false;
    UIButton *buttonZ = [[UIButton alloc] init];
    buttonZ = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonZ setTitle: NSLocalizedString([alphabets lastObject], nil) forState:UIControlStateNormal];
    buttonZ.titleLabel.numberOfLines = 0;
    [buttonZ.titleLabel setFont:[UIFont boldSystemFontOfSize:50.0]];
    [buttonZ addTarget:self action:@selector(alphabetPressed:) forControlEvents:UIControlEventTouchUpInside];
    buttonZ.translatesAutoresizingMaskIntoConstraints = false;
    [buttonVerticalStackViewZ addArrangedSubview:buttonZ];
    [horizontalstackView addArrangedSubview:buttonVerticalStackViewZ];
    
    return horizontalstackView;
}


- (void)setupStackViews {
    UIStackView *blanksHorizontalStackView = [self setupBlankHorizontalStackView];
    UIStackView *HorizontalStackViewOfAtoZButtons = [self setupHorizontalStackViewOfAToZButtons];
    
    // Main Stack View
    UIStackView *mainstackView = [[UIStackView alloc] init];
    mainstackView.axis = UILayoutConstraintAxisVertical;
    mainstackView.alignment = UIStackViewAlignmentFill;
    mainstackView.distribution = UIStackViewDistributionFillEqually;
    mainstackView.spacing = 0;
    mainstackView.translatesAutoresizingMaskIntoConstraints = false;
    [mainstackView addArrangedSubview:self.hangmanLabel];
    [mainstackView addArrangedSubview:self.clueLabel];
    [mainstackView addArrangedSubview:blanksHorizontalStackView];
    [mainstackView addArrangedSubview:HorizontalStackViewOfAtoZButtons];
    
    //Constraining Main Stack View to superview
    [self.view addSubview:mainstackView];
    [mainstackView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor].active = true;
    [mainstackView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor].active = true;
    [mainstackView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = true;
    [mainstackView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = true;
}

-(void) alphabetPressed: (UIButton*) sender {
    int alphabetLocationStopper = 0;
    for (UIView *mainSubView in self.view.subviews){
        if([mainSubView isKindOfClass:[UIStackView class]]){
            for (UIView *subViewsInStackView in mainSubView.subviews){
                if([subViewsInStackView isKindOfClass:[UIStackView class]]){
                    if(subViewsInStackView.tag == 100){
                        for (UIView *blanksButtonsView in subViewsInStackView.subviews){
                            if([blanksButtonsView isKindOfClass:[UIButton class]] && [[self getLetterLocations:sender.titleLabel.text] containsObject:[NSNumber numberWithInteger:alphabetLocationStopper]]){
                                UIButton *blankButton = (UIButton *)blanksButtonsView;
                                [blankButton setTitle: NSLocalizedString(sender.titleLabel.text, nil) forState:UIControlStateNormal];
                            }
                            alphabetLocationStopper++;
                        }
                    }
                }
            }
        }
    }
}

-(NSMutableArray*) getLetterLocations: (NSString*) alphabet {
    NSString *word = @"HELLO";
    NSMutableArray *letterLocationArray = [[NSMutableArray alloc] init];
    NSArray *results = [self rangesOfString:alphabet inString:word];
    for (int i=0; i<results.count; i++) {
        NSValue *value = (NSValue *)results[i];
        NSRange range = [value rangeValue];
        [letterLocationArray addObject:[NSNumber numberWithInteger:range.location]];
    }
    return letterLocationArray;
}

- (NSArray *)rangesOfString:(NSString *)searchString inString:(NSString *)str {
    NSMutableArray *results = [NSMutableArray array];
    NSRange searchRange = NSMakeRange(0, [str length]);
    NSRange range;
    while ((range = [str rangeOfString:searchString options:0 range:searchRange]).location != NSNotFound) {
        [results addObject:[NSValue valueWithRange:range]];
        searchRange = NSMakeRange(NSMaxRange(range), [str length] - NSMaxRange(range));
    }
    return results;
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
