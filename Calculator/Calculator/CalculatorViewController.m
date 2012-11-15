//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Hussain Miah on 24/10/2012.
//  Copyright (c) 2012 Hussain Miah. All rights reserved.
//

//This is the code for the implemention of this application

#import "CalculatorViewController.h"
#import "CalculatorModel.h"

//These are the private properties
@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorModel *calculatorModel;
@end

@implementation CalculatorViewController
@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize calculatorModel = _calculatorModel;

- (CalculatorModel *)calculatorModel{
    if(_calculatorModel == nil)
    {
        _calculatorModel = [[CalculatorModel alloc]init];
    }
    return _calculatorModel;
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digitPressed = sender.currentTitle;
    if(self.userIsInTheMiddleOfEnteringANumber == YES)
    {
        self.display.text = [self.display.text stringByAppendingString:digitPressed];
    }
    else
    {
        self.display.text = digitPressed;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
    NSLog(@"The digit that was pressed was: %@", digitPressed);
}

- (IBAction)operationPressed:(UIButton *)sender {
    if(self.userIsInTheMiddleOfEnteringANumber)
    {
        [self enterPressed];
    }
    double result = [self.calculatorModel performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
}

- (IBAction)enterPressed {
    [self.calculatorModel pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

@end
