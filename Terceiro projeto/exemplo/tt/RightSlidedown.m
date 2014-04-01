//
//  RightSlidedown.m
//  aula gesture- custom gest
//
//  Created by ALESSANDRO CAMILLO GIMENEZ DE MENEZES on 12/02/14.
//  Copyright (c) 2014 ALESSANDRO CAMILLO GIMENEZ DE MENEZES. All rights reserved.
//

#import "RightSlidedown.h"

@implementation RightSlidedown

-(id)initWithTarget:(id)target action:(SEL)action
{
    
    if ((self = [super initWithTarget:target action:action]))
    {
        self.final = 0;
        self.inicial = 0;
        // so simple there's no setup
    }
    
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    /*
    if ([touch locationInView:self.view].x < CGRectGetMidX(self.view.bounds))
    {
        self.state = UIGestureRecognizerStateFailed;
    }
    else
    {
        if ([touch locationInView:self.view].y > CGRectGetMidY(self.view.bounds))
        {
            self.state = UIGestureRecognizerStateFailed;
        }
    }
     */
    self.inicial = [touch locationInView:self.view].y;
    
    NSLog(@"comecou ");
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    /*
    if([touch locationInView:self.view].x < CGRectGetMidX(self.view.bounds))
    {
        self.state = UIGestureRecognizerStateFailed;
    }
     */
    
    self.final = [touch locationInView:self.view].y;
    
    NSLog(@"moveu");
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    /*
    if ([touch locationInView:self.view].x < CGRectGetMidX(self.view.bounds))
    {
        self.state = UIGestureRecognizerStateFailed;
    }
    else
    {
        if ([touch locationInView:self.view].y < CGRectGetMidY(self.view.bounds))
        {
            self.state = UIGestureRecognizerStateFailed;
        }
        else
        {
            // setting the state to recognized fires the target/action pair of the recognizer
            self.state = UIGestureRecognizerStateRecognized;
        }
    }
     */
    
    float result = (self.final - self.inicial );
    
    if (self.final != 0 )
    {
        if (result < 0) {
            result = result * (-1);
        }
        
        if ((result ) > 200) {
            self.state = UIGestureRecognizerStateRecognized;
        }
        else{
            self.state = UIGestureRecognizerStateFailed;
        }
    }
    else{
        self.state = UIGestureRecognizerStateFailed;
    }
    
    NSLog(@"acabou , %f   , %f"  ,self.final , self.inicial);
    
    self.final = 0;
    self.inicial = 0;

}


-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.state = UIGestureRecognizerStateCancelled;
    
    NSLog(@"cancelou");
}

-(void)reset{
    // so simple there's no reset
}

@end
