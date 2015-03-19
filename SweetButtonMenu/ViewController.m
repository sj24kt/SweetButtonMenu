//
//  ViewController.m
//  SweetButtonMenu
//
//  Created by Sherrie Jones on 3/19/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property UIButton *mainButton;
@property UIButton *menuButton1;
@property UIButton *menuButton2;
@property UIButton *menuButton3;
@property UIDynamicAnimator *dynamicAnimator;
@property BOOL areButtonsFanned;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // create the 4 buttons - must be in stack order with top button on bottom of list
    self.menuButton1 = [self createButtonWithTitle:@"1"];
    self.menuButton2 = [self createButtonWithTitle:@"2"];
    self.menuButton3 = [self createButtonWithTitle:@"3"];
    self.mainButton = [self createButtonWithTitle:@"P"];

    self.areButtonsFanned = NO;

    // sets action of clicking the main P button
    [self.mainButton addTarget:self action:@selector(fanButtons:) forControlEvents:UIControlEventTouchUpInside];

    // tells the button
    self.dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (UIButton *)createButtonWithTitle:(NSString *)title {
    CGRect frame = self.view.frame;
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(frame.size.width - 50, frame.size.height - 50, 50, 50)];
    self.title = @"p";

    button.layer.cornerRadius = button.bounds.size.width / 2;
    button.layer.borderWidth = 1.0;
    button.backgroundColor = [UIColor whiteColor];
    button.layer.borderColor = button.titleLabel.textColor.CGColor;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [self.view addSubview:button];

    return button;
}

// makes the 3 fan buttons animate out from button P
- (void)fanButtons:(id)sender {
    [self.dynamicAnimator removeAllBehaviors];

    if (self.areButtonsFanned) {
        [self fanIn];
    } else {
        [self fanOut];
    }
    self.areButtonsFanned = !self.areButtonsFanned;
}

- (void)fanOut {
    CGPoint point;
    UISnapBehavior *snapBehavior;

    // button 1
    point = CGPointMake(self.mainButton.frame.origin.x - 50, self.mainButton.frame.origin.y + 20);
    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.menuButton1 snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];

    // button 2
    point = CGPointMake(self.mainButton.frame.origin.x - 45, self.mainButton.frame.origin.y - 45);
    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.menuButton2 snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];

    // button 3
    point = CGPointMake(self.mainButton.frame.origin.x + 20, self.mainButton.frame.origin.y - 50);
    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.menuButton3 snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];
}

- (void)fanIn {
    UISnapBehavior *snapBehavior;

    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.menuButton1 snapToPoint:self.mainButton.center];
    [self.dynamicAnimator addBehavior:snapBehavior];

    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.menuButton2 snapToPoint:self.mainButton.center];
    [self.dynamicAnimator addBehavior:snapBehavior];

    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.menuButton3 snapToPoint:self.mainButton.center];
    [self.dynamicAnimator addBehavior:snapBehavior];
}

@end







































