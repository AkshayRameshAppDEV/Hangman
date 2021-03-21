//
//  ViewController.m
//  Hangman
//
//  Created by Akshay Ramesh on 3/6/21.
//

#import "PickThemeViewController.h"
#import "GameViewController.h"

@interface PickThemeViewController ()

@end

@implementation PickThemeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTopLabels];
    [self setUpHorizontalStackViewButtons];
    [self setUpStackViews];
}

//MARK: LABELS
-(void) setUpTopLabels {
    // Welcome to Hangman Title Label
    self.welcomeToHangmanTitleLabel = [[UILabel alloc] init];
    self.welcomeToHangmanTitleLabel.text = NSLocalizedString(@"pick_theme_welcome_to_hangman_title_label", nil);
    self.welcomeToHangmanTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.welcomeToHangmanTitleLabel.numberOfLines = 0;
    self.welcomeToHangmanTitleLabel.font = [UIFont fontWithName:@"Marker Felt Wide" size:55.0];
    self.welcomeToHangmanTitleLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    // Pick a Theme Label
    self.pickAThemeSubTitleLabel = [[UILabel alloc] init];
    self.pickAThemeSubTitleLabel.text = NSLocalizedString(@"pick_theme_sub_title_label", nil);
    self.pickAThemeSubTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.pickAThemeSubTitleLabel.numberOfLines = 0;
    self.pickAThemeSubTitleLabel.font = [UIFont fontWithName:@"Marker Felt Wide" size:25.0];
    self.pickAThemeSubTitleLabel.translatesAutoresizingMaskIntoConstraints = false;
}

//MARK: HORIZONTAL STACK VIEW BUTTONS
-(void) setUpHorizontalStackViewButtons {
    // Movies Button
    self.moviesButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.moviesButton setTitle: NSLocalizedString(@"pick_theme_movies_button_title", nil) forState:UIControlStateNormal];
    self.moviesButton.titleLabel.numberOfLines = 0;
    [self.moviesButton setTag:0];
    self.moviesButton.layer.borderWidth = 5.0;
    self.moviesButton.layer.borderColor = UIColor.systemGrayColor.CGColor;
    [self.moviesButton addTarget:self action:@selector(clickThemesButton:) forControlEvents:UIControlEventTouchUpInside];
    self.moviesButton.translatesAutoresizingMaskIntoConstraints = false;

    // TV Shows Button
    self.tvShowsButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.tvShowsButton setTitle: NSLocalizedString(@"pick_theme_tv_shows_button_title", nil) forState:UIControlStateNormal];
    self.tvShowsButton.titleLabel.numberOfLines = 0;
    [self.tvShowsButton setTag:1];
    self.tvShowsButton.layer.borderWidth = 5.0;
    self.tvShowsButton.layer.borderColor = UIColor.systemGrayColor.CGColor;
    [self.tvShowsButton addTarget:self action:@selector(clickThemesButton:) forControlEvents:UIControlEventTouchUpInside];
    self.tvShowsButton.translatesAutoresizingMaskIntoConstraints = false;
    
    // Countries Button
    self.countriesButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.countriesButton setTitle: NSLocalizedString(@"pick_theme_countries_button_title", nil) forState:UIControlStateNormal];
    self.countriesButton.titleLabel.numberOfLines = 0;
    [self.countriesButton setTag:2];
    self.countriesButton.layer.borderWidth = 5.0;
    self.countriesButton.layer.borderColor = UIColor.systemGrayColor.CGColor;
    [self.countriesButton addTarget:self action:@selector(clickThemesButton:) forControlEvents:UIControlEventTouchUpInside];
    self.countriesButton.translatesAutoresizingMaskIntoConstraints = false;

    // Famous People Button
    self.famousPeopleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.famousPeopleButton setTitle: NSLocalizedString(@"pick_theme_famous_people_button_title", nil) forState:UIControlStateNormal];
    self.famousPeopleButton.titleLabel.numberOfLines = 0;
    [self.famousPeopleButton setTag:3];
    self.famousPeopleButton.layer.borderWidth = 5.0;
    self.famousPeopleButton.layer.borderColor = UIColor.systemGrayColor.CGColor;
    [self.famousPeopleButton addTarget:self action:@selector(clickThemesButton:) forControlEvents:UIControlEventTouchUpInside];
    self.famousPeopleButton.translatesAutoresizingMaskIntoConstraints = false;
    
    // Words from Button
    self.wordsFromDictionaryButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.wordsFromDictionaryButton setTitle: NSLocalizedString(@"pick_theme_dictionary_words_button_title", nil) forState:UIControlStateNormal];
    self.wordsFromDictionaryButton.titleLabel.numberOfLines = 0;
    [self.wordsFromDictionaryButton setTag:4];
    self.wordsFromDictionaryButton.layer.borderWidth = 5.0;
    self.wordsFromDictionaryButton.layer.borderColor = UIColor.systemGrayColor.CGColor;
    [self.wordsFromDictionaryButton addTarget:self action:@selector(clickThemesButton:) forControlEvents:UIControlEventTouchUpInside];
    self.wordsFromDictionaryButton.translatesAutoresizingMaskIntoConstraints = false;

    // MIX ALL Button
    self.mixAllThemesButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.mixAllThemesButton setTitle: NSLocalizedString(@"pick_theme_mix_all_button_title", nil) forState:UIControlStateNormal];
    self.mixAllThemesButton.titleLabel.numberOfLines = 0;
    [self.mixAllThemesButton setTag:5];
    self.mixAllThemesButton.layer.borderWidth = 5.0;
    self.mixAllThemesButton.layer.borderColor = UIColor.systemGrayColor.CGColor;
    [self.mixAllThemesButton addTarget:self action:@selector(clickThemesButton:) forControlEvents:UIControlEventTouchUpInside];
    self.mixAllThemesButton.translatesAutoresizingMaskIntoConstraints = false;
}

//MARK: STACK VIEW AND CONSTAINTS TO SUPER VIEW
-(void) setUpStackViews {
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
    
    //Constraining Main Stack View to superview
    [self.view addSubview:mainstackView];
    [mainstackView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor].active = true;
    [mainstackView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor].active = true;
    [mainstackView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = true;
    [mainstackView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = true;
}

//MARK: BUTTONS CLICK LISTENER

-(void) clickThemesButton: (UIButton*) sender {
    NSString *wordFromTheme = sender.titleLabel.text;
    NSString *clue = @"Theme";
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
            NSLog(@"INVALID BUTTON");
            break;
    }
    GameViewController *gameVC = [[GameViewController alloc] init];
    gameVC.gameWord = wordFromTheme;
    gameVC.clue = clue;
    [self.navigationController pushViewController:gameVC animated:YES];
}

@end
