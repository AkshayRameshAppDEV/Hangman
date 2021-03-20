//
//  GameViewController.h
//  Hangman
//
//  Created by Akshay Ramesh on 3/10/21.
//

#import <UIKit/UIKit.h>
#import "HangmanBrain.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameViewController : UIViewController

@property (nonatomic, strong) UILabel *hangmanLabel;
@property (nonatomic, strong) UILabel *clueLabel;
@property (nonatomic, strong) HangmanBrain *hangmanBrain;
@property (nonatomic, strong) NSString *gameWord;

-(void) exitGame:(UIBarButtonItem *)sender;
-(void) setupNavbar;
-(void) setupLabels;
-(void) setupStackViews;
-(void) alphabetPressed: (UIButton*) sender;
-(UIStackView*) setupBlankHorizontalStackView;
-(UIStackView*) setupHorizontalStackViewOfAToZButtons;

@end

NS_ASSUME_NONNULL_END
