//
//  GameViewController.h
//  Hangman
//
//  Created by Akshay Ramesh on 3/10/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameViewController : UIViewController

@property (nonatomic, strong) UILabel *hangmanLabel;
@property (nonatomic, strong) UILabel *clueLabel;
@property (nonatomic, strong) UILabel *blanksLabel;

-(void) exitGame:(UIBarButtonItem *)sender;
-(void) setupNavbar;
-(void) setupLabels;
-(void) setupStackViews;

@end

NS_ASSUME_NONNULL_END
