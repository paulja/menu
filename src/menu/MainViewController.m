//
//  MainViewController.m
//  menu
//
//  Created by Paul Jackson on 13/11/2014.
//  Copyright (c) 2014 Paul Jackson. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

- (IBAction)tapAction:(id)sender;

@end

@implementation MainViewController

- (IBAction)tapAction:(id)sender {
    [self performSegueWithIdentifier:@"Page2" sender:self];
}

@end
