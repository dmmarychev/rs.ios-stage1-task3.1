#import "Combinator.h"

@implementation Combinator

- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    
    int neededPostersCount = [[array firstObject] intValue];
    int availableColorsCount = [[array lastObject] intValue];
    
    NSNumber *result = nil;
    int currentMinimalColorsCount;

    for (int i = 1; i <= availableColorsCount; i++) {
        
        currentMinimalColorsCount = i;
        
        long long countOfPostersForCurrentMinimalColorsCount = [self factorialForNumber:availableColorsCount] /
                ([self factorialForNumber:currentMinimalColorsCount] * [self factorialForNumber:(availableColorsCount - currentMinimalColorsCount)]);
        
        if (countOfPostersForCurrentMinimalColorsCount == neededPostersCount) {
            return [NSNumber numberWithInt:currentMinimalColorsCount];
        }
    }
    
    return result;
}

- (long long)factorialForNumber:(int)number {
    
    int currentNumber = 1;
    long long factorialResult = 1;
    
    while (currentNumber <= number) {
        
        factorialResult *= currentNumber;
        currentNumber++;
    }

    return factorialResult;
}
@end
