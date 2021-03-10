//
//  ViewController.h
//  Hangman
//
//  Created by Akshay Ramesh on 3/6/21.
//

#import <UIKit/UIKit.h>

@interface PickThemeViewController : UIViewController

@property (nonatomic, strong) UILabel *welcomeToHangmanTitleLabel;
@property (nonatomic, strong) UILabel *pickAThemeSubTitleLabel;
@property (nonatomic, strong) UIButton *famousPeopleButton;
@property (nonatomic, strong) UIButton *countriesButton;
@property (nonatomic, strong) UIButton *moviesButton;
@property (nonatomic, strong) UIButton *tvShowsButton;
@property (nonatomic, strong) UIButton *wordsFromDictionaryButton;
@property (nonatomic, strong) UIButton *mixAllThemesButton;

-(void) setUpTopLabels;
-(void) setUpHorizontalStackViewButtons;
-(void) setUpStackViews;
-(void) clickThemesButton: (UIButton*) sender;

@end

