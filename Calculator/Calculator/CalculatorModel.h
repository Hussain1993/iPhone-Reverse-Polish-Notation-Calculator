//
//  CalculatorModel.h
//  Calculator
//
//  Created by Hussain Miah on 24/10/2012.
//  Copyright (c) 2012 Hussain Miah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorModel : NSObject

-(void)pushOperand:(double)operand;
-(double)performOperation:(NSString *)operation;
-(void)clearStack;

@end
