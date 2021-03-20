//
//  HangmanBrain.h
//  Hangman
//
//  Created by Akshay Ramesh on 3/16/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HangmanBrain : NSObject

- (NSMutableArray*) getLetterLocations: (NSString*) alphabet;
- (NSArray *)rangesOfString:(NSString *)searchString inString:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
