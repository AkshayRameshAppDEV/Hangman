//
//  ReachabilityHelper.h
//  Hangman
//
//  Created by Akshay Ramesh on 3/20/21.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReachabilityHelper : NSObject

@property (nonatomic, strong) Reachability *internetReachability;

- (void) internetStatus:(Reachability *)reachability;
-(void) setup;

@end

NS_ASSUME_NONNULL_END
