//
//  HangmanBrain.m
//  Hangman
//
//  Created by Akshay Ramesh on 3/16/21.
//

#import "HangmanBrain.h"

@implementation HangmanBrain

- (void) setWordOfTheDay: (NSString*) word {
    _wordOfTheDay = word;
}

- (NSString*) getWordOfTheDay {
    return _wordOfTheDay;
}

-(NSMutableArray*) getLetterLocations: (NSString*) alphabet {
    NSMutableArray *letterLocationArray = [[NSMutableArray alloc] init];
    NSArray *results = [self rangesOfString:alphabet inString:[self getWordOfTheDay]];
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

@end
