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
    
    //MARK: LABELS
    // Welcome to Hangman Title Label
    self.welcomeToHangmanTitleLabel = [[UILabel alloc] init];
    self.welcomeToHangmanTitleLabel.text = @"Welcome to Hangman"; // Replace with NSLOCALIZED STRING LATER
    self.welcomeToHangmanTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.welcomeToHangmanTitleLabel.numberOfLines = 0;
    self.welcomeToHangmanTitleLabel.font = [UIFont boldSystemFontOfSize:25.0];
    self.welcomeToHangmanTitleLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    // Pick a Theme Label
    self.pickAThemeSubTitleLabel = [[UILabel alloc] init];
    self.pickAThemeSubTitleLabel.text = @"Pick a Theme"; // Replace with NSLOCALIZED STRING LATER
    self.pickAThemeSubTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.pickAThemeSubTitleLabel.numberOfLines = 0;
    self.pickAThemeSubTitleLabel.font = [UIFont boldSystemFontOfSize:20.0];
    self.pickAThemeSubTitleLabel.translatesAutoresizingMaskIntoConstraints = false;


    //MARK: BUTTONS
    // Movies Button
    self.moviesButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.moviesButton setTitle:@"MOVIES" forState:UIControlStateNormal]; // Replace with NSLOCALIZED STRING LATER
    [self.moviesButton setTag:0];
    [self.moviesButton addTarget:self action:@selector(clickThemesButton:) forControlEvents:UIControlEventTouchUpInside];
    self.moviesButton.translatesAutoresizingMaskIntoConstraints = false;

    // TV Shows Button
    self.tvShowsButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.tvShowsButton setTitle:@"TV SHOWS" forState:UIControlStateNormal]; // Replace with NSLOCALIZED STRING LATER
    [self.tvShowsButton setTag:1];
    [self.tvShowsButton addTarget:self action:@selector(clickThemesButton:) forControlEvents:UIControlEventTouchUpInside];
    self.tvShowsButton.translatesAutoresizingMaskIntoConstraints = false;
    
    // Countries Button
    self.countriesButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.countriesButton setTitle:@"COUNTRIES" forState:UIControlStateNormal]; // Replace with NSLOCALIZED STRING LATER
    [self.countriesButton setTag:2];
    [self.countriesButton addTarget:self action:@selector(clickThemesButton:) forControlEvents:UIControlEventTouchUpInside];
    self.countriesButton.translatesAutoresizingMaskIntoConstraints = false;

    // Famous People Button
    self.famousPeopleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.famousPeopleButton setTitle:@"FAMOUS PEOPLE" forState:UIControlStateNormal]; // Replace with NSLOCALIZED STRING LATER
    [self.famousPeopleButton setTag:3];
    [self.famousPeopleButton addTarget:self action:@selector(clickThemesButton:) forControlEvents:UIControlEventTouchUpInside];
    self.famousPeopleButton.translatesAutoresizingMaskIntoConstraints = false;
    
    // Words from Button
    self.wordsFromDictionaryButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.wordsFromDictionaryButton setTitle:@"DICTIONARY WORDS" forState:UIControlStateNormal]; // Replace with NSLOCALIZED STRING LATER
    [self.wordsFromDictionaryButton setTag:4];
    [self.wordsFromDictionaryButton addTarget:self action:@selector(clickThemesButton:) forControlEvents:UIControlEventTouchUpInside];
    self.wordsFromDictionaryButton.translatesAutoresizingMaskIntoConstraints = false;

    // MIX ALL Button
    self.mixAllThemesButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.mixAllThemesButton setTitle:@"MIX ALL" forState:UIControlStateNormal]; // Replace with NSLOCALIZED STRING LATER
    [self.mixAllThemesButton setTag:5];
    [self.mixAllThemesButton addTarget:self action:@selector(clickThemesButton:) forControlEvents:UIControlEventTouchUpInside];
    self.mixAllThemesButton.translatesAutoresizingMaskIntoConstraints = false;
    
    //MARK: STACK VIEWS
    // Horizontal Stack View 1
    UIStackView *horizontalStackView1 = [[UIStackView alloc] init];
    horizontalStackView1.axis = UILayoutConstraintAxisHorizontal;
    horizontalStackView1.alignment = UIStackViewAlignmentFill;
    horizontalStackView1.distribution = UIStackViewDistributionFillEqually;
    horizontalStackView1.spacing = 0;
    horizontalStackView1.translatesAutoresizingMaskIntoConstraints = false;
    [horizontalStackView1 addArrangedSubview:self.moviesButton];
    [horizontalStackView1 addArrangedSubview:self.tvShowsButton];
    
    // Horizontal Stack View 2
    UIStackView *horizontalStackView2 = [[UIStackView alloc] init];
    horizontalStackView2.axis = UILayoutConstraintAxisHorizontal;
    horizontalStackView2.alignment = UIStackViewAlignmentFill;
    horizontalStackView2.distribution = UIStackViewDistributionFillEqually;
    horizontalStackView2.spacing = 0;
    horizontalStackView2.translatesAutoresizingMaskIntoConstraints = false;
    [horizontalStackView2 addArrangedSubview:self.countriesButton];
    [horizontalStackView2 addArrangedSubview:self.famousPeopleButton];
    
    // Horizontal Stack View 3
    UIStackView *horizontalStackView3 = [[UIStackView alloc] init];
    horizontalStackView3.axis = UILayoutConstraintAxisHorizontal;
    horizontalStackView3.alignment = UIStackViewAlignmentFill;
    horizontalStackView3.distribution = UIStackViewDistributionFillEqually;
    horizontalStackView3.spacing = 0;
    horizontalStackView3.translatesAutoresizingMaskIntoConstraints = false;
    [horizontalStackView3 addArrangedSubview:self.wordsFromDictionaryButton];
    [horizontalStackView3 addArrangedSubview:self.mixAllThemesButton];
    
    
    // Main Stack View
    UIStackView *mainstackView = [[UIStackView alloc] init];
    mainstackView.axis = UILayoutConstraintAxisVertical;
    mainstackView.alignment = UIStackViewAlignmentFill;
    mainstackView.distribution = UIStackViewDistributionFillEqually;
    mainstackView.spacing = 0;
    mainstackView.translatesAutoresizingMaskIntoConstraints = false;
    [mainstackView addArrangedSubview:self.welcomeToHangmanTitleLabel];
    [mainstackView addArrangedSubview:self.pickAThemeSubTitleLabel];
    [mainstackView addArrangedSubview:horizontalStackView1];
    [mainstackView addArrangedSubview:horizontalStackView2];
    [mainstackView addArrangedSubview:horizontalStackView3];

    
    [self.view addSubview:mainstackView];

    //MARK: STACK VIEW AND CONSTAINTS TO SUPER VIEW
    //Constraining Main Stack View to superview
    [mainstackView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor].active = true;
    [mainstackView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor].active = true;
    [mainstackView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = true;
    [mainstackView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = true;

}

//MARK: BUTTONS CLICK LISTENER

-(void) clickThemesButton: (UIButton*) sender {
    NSLog(@"Button Clicked Name: %@", sender.titleLabel.text);
    switch (sender.tag) {
        case 0:
            NSLog(@"Call Movies API");
            break;
        case 1:
            NSLog(@"Call TV SHOWS API");
            break;
        case 2:
            NSLog(@"Call COUNTRIES API");
            break;
        case 3:
            NSLog(@"Call FAMOUS PEOPLE API");
            break;
        case 4:
            NSLog(@"Call DICTIONARY WORDS API");
            break;
        case 5:
            NSLog(@"Call MIX ALL API");
            break;
        default:
            NSLog(@"WRONG BUTTON");
            break;
    }
}

@end
