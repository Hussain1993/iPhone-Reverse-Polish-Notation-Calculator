//
//  CalculatorModel.m
//  Calculator
//
//  Created by Hussain Miah on 24/10/2012.
//  Copyright (c) 2012 Hussain Miah. All rights reserved.
//

#import "CalculatorModel.h"

@interface CalculatorModel ()
@property (nonatomic, strong) NSMutableArray *operandStack;

@end

@implementation CalculatorModel
@synthesize operandStack = _operandStack;

-(NSMutableArray *)operandStack{
    /*
     This is making sure that the array is not
     a nil when we go to get it.
     */
    if (_operandStack == nil)
    {
        _operandStack = [[NSMutableArray alloc]init];
    }
    return _operandStack;
}

-(void)pushOperand:(double)operand{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}


-(double)popOperand{
    NSNumber *operandObject = [self.operandStack lastObject];
    if(operandObject !=nil)
    {
        [self.operandStack removeLastObject];
    }
    return [operandObject doubleValue];
}


-(double)performOperation:(NSString *)operation{
    double result = 0;
    if([operation isEqualToString:@"+"])
    {
        result = [self popOperand] + [self popOperand];
    }
    [self pushOperand:result];
    return result;
}


@end
