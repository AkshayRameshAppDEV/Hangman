//
//  ReachabilityHelper.m
//  Hangman
//
//  Created by Akshay Ramesh on 3/20/21.
//

#import "ReachabilityHelper.h"

@implementation ReachabilityHelper

- (void) setup {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    self.internetReachability = [Reachability reachabilityForInternetConnection];
    [self.internetReachability startNotifier];
}

- (void) reachabilityChanged:(NSNotification *)note {
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self internetStatus:curReach];
}

- (void)internetStatus:(Reachability *)reachability {
    if (reachability == self.internetReachability) {
        NetworkStatus netStatus = [reachability currentReachabilityStatus];
        switch (netStatus) {
            case NotReachable: {
                NSLog(@"NO INTERNET NOTIFICATION");
                [[NSNotificationCenter defaultCenter] postNotificationName: @"no_internet_notification" object: nil];
                break;
            }
            case ReachableViaWWAN:
            case ReachableViaWiFi: {
                NSLog(@"YES INTERNET");
                break;
            }
        }
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
