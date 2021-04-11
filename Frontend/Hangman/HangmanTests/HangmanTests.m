//
//  HangmanTests.m
//  HangmanTests
//
//  Created by Akshay Ramesh on 3/6/21.
//

#import <XCTest/XCTest.h>
#import "HangmanBrain.h"


@interface HangmanTests : XCTestCase

@end

@implementation HangmanTests

- (void)testHangmanBrain {
    HangmanBrain *hangmanBrain = [[HangmanBrain alloc] init];
    [hangmanBrain setWordOfTheDay:@"HANGMANTEST"];
    XCTAssertEqual([hangmanBrain getWordOfTheDay], @"HANGMANTEST");
    XCTAssertEqual([hangmanBrain getWordOfTheDayLength], 11);
    XCTAssertEqual([[hangmanBrain getLetterLocations:@"Z"] count], 0);
    XCTAssertNotNil([hangmanBrain getLetterLocations:@"H"]);
}

@end
