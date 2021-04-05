//
//  HangmanBrain.h
//  Hangman
//
//  Created by Akshay Ramesh on 3/16/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HangmanBrain : NSObject

@property (nonatomic, strong) NSString *wordOfTheDay;

- (NSMutableArray*) getLetterLocations: (NSString*) alphabet;
- (NSArray *)rangesOfString:(NSString *)searchString inString:(NSString *)str;
- (void) setWordOfTheDay: (NSString*) word;
- (NSString*) getWordOfTheDay;
- (NSInteger) getWordOfTheDayLength;
- (BOOL) isAlphabetInWordOfTheDay: (NSString*) alphabet;

@end

NS_ASSUME_NONNULL_END
