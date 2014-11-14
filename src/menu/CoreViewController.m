//
//  CoreViewController.m
//  menu
//
//  Created by Paul Jackson on 13/11/2014.
//  Copyright (c) 2014 Paul Jackson. All rights reserved.
//

#import "CoreViewController.h"

@interface CoreViewController ()

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tagGesture;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeGesture;

- (IBAction)tapAction:(UITapGestureRecognizer *)sender;
- (IBAction)swipeAction:(UISwipeGestureRecognizer *)sender;

@property (weak, nonatomic) IBOutlet UIView *mainView;

@end

@implementation CoreViewController
{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mainView.layer.masksToBounds = NO;
    self.mainView.layer.shadowOffset = CGSizeMake(-3, 0);
    self.mainView.layer.shadowRadius = 3;
    self.mainView.layer.shadowOpacity = 0.3;
    
    self.tagGesture.enabled = NO;
}

- (IBAction)tapAction:(UITapGestureRecognizer *)sender
{
    CGPoint location = [sender locationInView:self.view];
    CGRect frame = self.mainView.frame;
    NSLog(@"TAP %@ %@",
          NSStringFromCGPoint(location),
          NSStringFromCGRect(frame));
    
    if (location.x < frame.origin.x) return;
    
    self.mainView.userInteractionEnabled = YES;
    self.tagGesture.enabled = NO;
    self.swipeGesture.enabled = YES;
    
    [UIView animateWithDuration:0.1 animations:^{
        self.mainView.frame = CGRectMake(
            0,
            frame.origin.y,
            frame.size.width,
            frame.size.height);
    }];
}

- (IBAction)swipeAction:(UISwipeGestureRecognizer *)sender
{
    CGPoint location = [sender locationInView:self.view];
    CGRect frame = self.mainView.frame;
    NSLog(@"SWIPE %@ %@",
          NSStringFromCGPoint(location),
          NSStringFromCGRect(frame));
    
    self.mainView.userInteractionEnabled = NO;
    self.tagGesture.enabled = YES;
    self.swipeGesture.enabled = NO;
    
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
        self.mainView.frame = CGRectMake(
            frame.origin.x + (self.view.frame.size.width - 50),
            frame.origin.y,
            frame.size.width,
            frame.size.height);
        
    } completion:nil];
}

- (IBAction)unwindToCore:(UIStoryboardSegue *)unwindSegue
{
    NSLog(@"UNWIND");
    self.swipeGesture.enabled = YES;
}
@end
