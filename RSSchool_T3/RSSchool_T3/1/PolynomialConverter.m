#import "PolynomialConverter.h"

@implementation PolynomialConverter

- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    
    if ([numbers count] == 0) {
        return nil;
    }
    
    NSMutableString *result = [NSMutableString string];
    NSUInteger currentDegree = [numbers count] - 1;
    NSUInteger lastNumberIndex = [numbers count] - 1;
    
    [[numbers firstObject] intValue] < 0 ? [result appendString:@"-"] : 0;
    
    for (int i = 0; i < [numbers count]; i++) {
        
        int currentPositiveNumberValue = abs([[numbers objectAtIndex:i] intValue]);
        
        if (i == lastNumberIndex) {
            
            currentPositiveNumberValue == 0 ? 0 : [result appendFormat:@"%d", currentPositiveNumberValue];
            
        } else {
            
            int nextNumberValue = [[numbers objectAtIndex:i + 1] intValue];
            NSString *plusMinus = nextNumberValue >= 0 ? @"+" : @"-";
            
            if (currentPositiveNumberValue == 0) {
                currentDegree--;
                continue;
            } else if (currentPositiveNumberValue == 1) {
                [result appendFormat:@"x"];
            } else {
                [result appendFormat:@"%dx", currentPositiveNumberValue];
            }
            
            currentDegree > 1 ? [result appendFormat:@"^%lu", currentDegree] : 0;
            
            BOOL nextNumberAreLast = (i + 1 == lastNumberIndex) ? YES : NO;
            BOOL nextNumberAreZero = nextNumberValue == 0 ? YES : NO;
            
            nextNumberAreLast && nextNumberAreZero ? 0 : [result appendFormat:@" %@ ", plusMinus];
            currentDegree--;
        }
    }
    return result;
}

@end
